//
//  ViewController.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/05.
//

//import UIKit
//import SnapKit
//
//class KmoocListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    var viewModel = KmoocListViewModel()
//    
//    let tableView : UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .white
//        return tableView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationItem.title = "K-Mooc"
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        //tableView.register(ClassTableViewCell.classForCoder(), forCellReuseIdentifier: "myClass")
//        
//        view.addSubview(tableView)
//        
//        tableView.snp.makeConstraints { (maker) in
//            maker.top.bottom.leading.trailing.equalTo(0)
//        }
//        
//        viewModel.listUpdate = { [weak self] in
//            DispatchQueue.main.async {
//                print("list update")
//                self?.tableView.reloadData()
//            }
//        }
//        
//        viewModel.listUP()
//    }
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return viewModel.classesCount()
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myClass") as! ClassTableViewCell
//        
//        if let myClass = viewModel.indexClass(indexPath: indexPath){
//            cell.drawCell(myClass: myClass)
//        }
//       
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cellClass = viewModel.indexClass(indexPath: indexPath)
//    
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
////        print("scroll")
//        let contentHeight = scrollView.contentSize.height
//        let offset = scrollView.contentOffset.y
//     
//        if offset > contentHeight - scrollView.frame.height{ 
//            print("오버")
//            viewModel.listUP()
//        }
//        
//    }
//}
//
