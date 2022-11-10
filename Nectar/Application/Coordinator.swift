//
//  Coordinator.swift
//  Nectar
//
//  Created by  User on 06.11.2022.
//

import Foundation
import UIKit

protocol Coordinatable: AnyObject {
    func start ()
}

protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  
  func toPresent() -> UIViewController? {
    return self
  }
}

class BaseCoordinator {
    
    var childCoordinators = [Coordinatable]()
    
    func addDependency(_ coordinator: Coordinatable) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinatable?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

protocol Factory {
    func makeAuthorizationCoordinatorBox (router: Routable) -> Coordinatable
    func makeHomeCoordinatorBox (router: Routable) -> Coordinatable
}

class FactoryImplementation: Factory {
    func makeAuthorizationCoordinatorBox(router: Routable) -> Coordinatable {
        let coordinator = WelcomeCoordinator(factory: WelcomeFactoryImplementation(), router: router)
        return coordinator
    }
    
    func makeHomeCoordinatorBox(router: Routable) -> Coordinatable {
        let coordinator = TabBarCoordinator(factory: TabBarFactoryImplementation(), router: router)
        return coordinator
    }
}

protocol Routable {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
//    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?)
//    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}

final class Router: Routable {
    
    private var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let view = module?.toPresent() else { return }
        navigationController.present(view, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        guard let view = module?.toPresent() else { return }
        navigationController.pushViewController(view, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable?) {
        guard let view = module?.toPresent() else { return }
        navigationController.setViewControllers([view], animated: true)
    }
    
    func popToRootModule(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
}

enum Authorized {
    case auth
    case home
}

class AppCoordinator: BaseCoordinator, Coordinatable {
    
    private var factory: Factory
    private var router: Routable
    private var state: Authorized
    
    init(factory: Factory, router: Routable, state: Authorized) {
        self.factory = factory
        self.router = router
        self.state = state
    }
    
    func start() {
        switch state {
        case .auth:
            let coordinator = factory.makeAuthorizationCoordinatorBox(router: router)
            addDependency(coordinator)
            coordinator.start()
        case .home:
            let coordinator = factory.makeHomeCoordinatorBox(router: router)
            addDependency(coordinator)
            coordinator.start()
        }
    }
}
