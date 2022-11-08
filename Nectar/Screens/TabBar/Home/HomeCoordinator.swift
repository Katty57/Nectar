//
//  HomeCoordinator.swift
//  Nectar
//
//  Created by  User on 07.11.2022.
//

import Foundation

protocol HomeFactory {
    
}

class HomeFactoryImplementation: HomeFactory {
    
}

final class HomeCoordinator: BaseCoordinator, Coordinatable {
    private var factory: HomeFactory
    private var router: Routable
    
    init(factory: HomeFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
    
    func start() {
        let vc = HomeViewController()
        router.present(vc)
    }
}
