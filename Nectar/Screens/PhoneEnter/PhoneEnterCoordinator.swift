//
//  PhoneEnterCoordinator.swift
//  Nectar
//
//  Created by  User on 08.11.2022.
//

import Foundation
import SwiftUI

protocol PhoneEnterFactory {
    
}

class PhoneEnterFactoryImplementation: PhoneEnterFactory {

}

final class PhoneEnterCoordinator: BaseCoordinator, Coordinatable {
    private var factory: PhoneEnterFactory
    private var router: Routable
    
    init(factory: PhoneEnterFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
    
    func start() {
        let view = PhoneEnterViewController()
        router.push(view)
    }
}
