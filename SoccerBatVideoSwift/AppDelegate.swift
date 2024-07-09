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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        let matchViewReactor = MatchViewReactor()
        let rootViewController = UINavigationController(rootViewController: MatchListViewController(reactor: matchViewReactor))
        
        window?.rootViewController = rootViewController // root로 설정할 UIViewController
        window?.makeKeyAndVisible()

        
        return true
    }



}

