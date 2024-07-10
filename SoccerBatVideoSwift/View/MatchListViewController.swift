//
//  MatchListViewController.swift
//  KmoocSwift
//
//  Created by 박성영 on 7/10/24.
//

import UIKit
import SnapKit
import ReactorKit
import RxSwift
import RxCocoa

class MatchListViewController: UIViewController, View {
    
    typealias Reactor = MatchViewReactor
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 80
        
        return tableView
    }()
    
    typealias DataSource = UITableViewDiffableDataSource<Int, FeedData?>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, FeedData?>
    var dataSource: DataSource!
    
    // MARK: - Intializer
    convenience init(reactor: MatchViewReactor) {
        self.init()
        self.reactor = reactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func bind(reactor: MatchViewReactor) {
        print("bind")
        reactor.action.onNext(.listUp)
        
        reactor.state
            .skip(1)
            .map { $0.feedDatas }
            .filter {  !($0.isEmpty) }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] feedData in
                self?.updateTableView(with: feedData)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .map { Reactor.Action.selectMatch($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
    }
    
    func setupUI() {
        navigationItem.title = "축구 최신 소식"
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(MatchFeedViewCell.self, forCellReuseIdentifier: "MatchFeedcell")
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MatchFeedcell", for: indexPath) as? MatchFeedViewCell
            print("item --",item!.title)
            
            guard let item = item else {return cell }
            
            cell?.configure(with: item)
            //cell.textLabel?.text = item.title
        
            return cell
        }
    }
    
    func updateTableView(with data: [FeedData?]) {
          var snapshot = Snapshot()
          snapshot.appendSections([0])
            print("Data ---",data)
          snapshot.appendItems(data)
          dataSource.apply(snapshot, animatingDifferences: false)
      }
}


extension MatchListViewController : UITableViewDelegate {
    
}
