//
//  MatchListViewController.swift
//  KmoocSwift
//
//  Created by 박성영 on 7/10/24.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

class MatchListViewController: UIViewController, View {
    
    typealias Reactor = MatchViewReactor
    
    var disposeBag: DisposeBag = DisposeBag()

    // MARK: - Intializer
    convenience init(reactor: MatchViewReactor) {
        self.init()
        self.reactor = reactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reactor?.action.onNext(.listUp)
    }
    
    func bind(reactor: MatchViewReactor) {
        print("bind")
    }
  

}
