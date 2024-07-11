//
//  AppDelegate.swift
//  KmoocSwift
//
//  Created by 박성영 on 2021/09/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    var mainCoordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        //        let matchViewReactor = MatchViewReactor()
        //        let rootViewController = UINavigationController(rootViewController: MatchListViewController(reactor: matchViewReactor))
        
        // 네비게이션 컨트롤러 초기화
        let navigationController = UINavigationController()
        
        // 메인 코디네이터 초기화
        mainCoordinator = MainCoordinator(navigationController: navigationController)
        
        // 코디네이터 시작
        mainCoordinator?.start()
        
        //window?.rootViewController = rootViewController // root로 설정할 UIViewController
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        return true
    }



}

