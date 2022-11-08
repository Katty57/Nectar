//
//  AuthorizationCoordinator.swift
//  Nectar
//
//  Created by  User on 07.11.2022.
//

import Foundation

enum SignInType {
    case phone, google, facebook
}

protocol SignInFactory {
    func makePhoneEnterCoordinatorBox (router: Routable) -> Coordinatable
}

class SignInFactoryImplementation: SignInFactory {
    func makePhoneEnterCoordinatorBox (router: Routable) -> Coordinatable {
        let coordinator = PhoneEnterCoordinator(factory: PhoneEnterFactoryImplementation(), router: router)
        return coordinator
    }
}

final class SignInCoordinator: BaseCoordinator, Coordinatable {
    private var factory: SignInFactory
    private var router: Routable
    
    init(factory: SignInFactory, router: Routable) {
        self.factory = factory
        self.router = router
    }
    
    func start() {
        let view = SignInViewController(coordinator: self)
        view.modalPresentationStyle = .fullScreen
        router.push(view)
    }
    
    func signInTypeSelected (with type: SignInType) {
        switch type {
        case .phone:
            let coordinator = factory.makePhoneEnterCoordinatorBox(router: router)
            addDependency(coordinator)
            coordinator.start()
        case .google, .facebook:
            break
        }
    }
}
