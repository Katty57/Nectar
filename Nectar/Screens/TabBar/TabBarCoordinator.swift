//
//  TabBarCoordinator.swift
//  Nectar
//
//  Created by  User on 07.11.2022.
//

import Foundation

protocol TabBarFactory {
    
}

class TabBarFactoryImplementation: TabBarFactory {
    
}

final class TabBarCoordinator: BaseCoordinator, Coordinatable {
    private var factory: TabBarFactory
    private var router: Routable
    
    init(factory: TabBarFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
    
    func start() {
        let view = TabBarController()
        router.push(view)
    }
}
