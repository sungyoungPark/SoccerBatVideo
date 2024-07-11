//
//  MainCoordinator.swift
//  SoccerBatVideoSwift
//
//  Created by 박성영 on 7/11/24.
//

import UIKit

protocol MyViewControllerDelegate: AnyObject {
    func myViewControllerDidRequestNavigation(with data: FeedData?)
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MatchListViewController()
        let reactor = MatchViewReactor()
        mainViewController.reactor = reactor
        mainViewController.delegate = self
        navigationController.pushViewController(mainViewController, animated: false)
    }
    
    func navigateToNextViewController(with data : FeedData?) {
        let nextViewController = DetailMatchViewController()
        let reactor = DetailMatchReactor(feedData: data)
        nextViewController.reactor = reactor
        navigationController.pushViewController(nextViewController, animated: true)
    }
    
}

extension MainCoordinator: MyViewControllerDelegate {
 
    func myViewControllerDidRequestNavigation(with data : FeedData?) {
        navigateToNextViewController(with: data)
    }
}
