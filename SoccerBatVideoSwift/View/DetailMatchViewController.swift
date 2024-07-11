//
//  DetailMatchViewController.swift
//  SoccerBatVideoSwift
//
//  Created by 박성영 on 7/11/24.
//

import UIKit
import ReactorKit
import RxSwift

class DetailMatchViewController: UIViewController, View {
    
    typealias Reactor = DetailMatchReactor
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    func bind(reactor: DetailMatchReactor) {
        reactor.state
            .map { $0.matchFeedData }
            .subscribe { feedData in
                print("seconde FeedData ---", feedData)
            }
            .disposed(by: disposeBag)
    }

}
