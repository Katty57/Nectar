//
//  AppDelegate.swift
//  Nectar
//
//  Created by  User on 10.10.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navVC = UINavigationController()
        let coordinator = createCoordinator(navVC: navVC)
        coordinator.start()
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func createCoordinator (navVC: UINavigationController) -> Coordinatable {
        let factory = FactoryImplementation()
        let router = Router(navigationController: navVC)
        let coordinator = AppCoordinator(factory: factory, router: router, state: .auth)
        return coordinator
    }
}

