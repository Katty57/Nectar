//
//  TabBarController.swift
//  Nectar
//
//  Created by  User on 18.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTabs()
        setUpUI()
    }
    
    private func addTabs () {
        let shopVC = HomeViewController()
        let shopNavC = UINavigationController(rootViewController: shopVC)
        let shopItem = UITabBarItem()
        shopItem.image = UIImage(asset: Asset.Assets.shop)
        shopItem.title = "Shop"
        shopNavC.tabBarItem = shopItem
        
        
        let exploreVC = ExploreViewController()
        let exploreNavC = UINavigationController(rootViewController: exploreVC)
        let exploreItem = UITabBarItem()
        exploreItem.image = UIImage(asset: Asset.Assets.explore)
        exploreItem.title = "Explore"
        exploreNavC.tabBarItem = exploreItem
        
        let cartVC = CartViewController()
        let cartNavC = UINavigationController(rootViewController: cartVC)
        let cartItem = UITabBarItem()
        cartItem.image = UIImage(asset: Asset.Assets.cart)
        cartItem.title = "Cart"
        cartNavC.tabBarItem = cartItem
        
        
        let favouriteVC = FavouriteViewController()
        let favouriteNavC = UINavigationController(rootViewController: favouriteVC)
        let favouriteItem = UITabBarItem()
        favouriteItem.image = UIImage(asset: Asset.Assets.favourite)
        favouriteItem.title = "Favourite"
        favouriteNavC.tabBarItem = favouriteItem
        
        let accountVC = AccountViewController()
        let accountNavC = UINavigationController(rootViewController: accountVC)
        let accountItem = UITabBarItem()
        accountItem.image = UIImage(asset: Asset.Assets.account)
        accountItem.title = "Account"
        accountNavC.tabBarItem = accountItem
        
        self.viewControllers = [shopNavC, exploreNavC, cartNavC, favouriteNavC, accountNavC]
    }
    
    private func setUpUI () {
        
        tabBar.tintColor = UIColor(asset: Asset.Colors.green)
        tabBar.unselectedItemTintColor = UIColor(asset: Asset.Colors.questionBlack)
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 15
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        tabBar.layer.shadowRadius = 37
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -12)
//        tabBar.layer.shadowColor = UIColor(asset: Asset.Colors.tabBarShadow)?.cgColor
        tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        tabBar.layer.shadowOpacity = 0.5
        
        let attributesNormal = [NSAttributedString.Key.font : UIFont(font: FontFamily.Gilroy.semiBold, size: 12),
                                NSAttributedString.Key.foregroundColor : UIColor(asset: Asset.Colors.questionBlack)]
        let attributesSelected = [NSAttributedString.Key.font : UIFont(font: FontFamily.Gilroy.semiBold, size: 12),
                                  NSAttributedString.Key.foregroundColor : UIColor(asset: Asset.Colors.green)]
        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal as [NSAttributedString.Key : Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected as [NSAttributedString.Key : Any], for: .selected)
    }

}
