//
//  WelcomeCoordinator.swift
//  Nectar
//
//  Created by  User on 07.11.2022.
//

import Foundation

protocol WelcomeFactory {
    func makeWelcomeCoordinatorBox (router: Routable) -> Coordinatable
}

class WelcomeFactoryImplementation: WelcomeFactory {
    func makeWelcomeCoordinatorBox (router: Routable) -> Coordinatable {
        let coordinator = SignInCoordinator(factory: SignInFactoryImplementation(), router: router)
        return coordinator
    }
}


final class WelcomeCoordinator: BaseCoordinator, Coordinatable {
    private var factory: WelcomeFactory
    private var router: Routable
    
    init(factory: WelcomeFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
    
    func start() {
        let view = WelcomeViewController(coordinator: self)
        router.push(view)
    }
    
    func buttonTaped () {
        let coordinator = factory.makeWelcomeCoordinatorBox(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
}
