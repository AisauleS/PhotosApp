//
//  PhotosTabbar.swift
//  PhotosApp
//
//  Created by Aisaule Sibatova on 16.03.2023.
//

import UIKit

class PhotosTabBar: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - TabBar Configuration
    
    func setupTabBarController() {
        tabBar.tintColor = .lightGray
        tabBar.selectedImageTintColor = UIColor.systemBlue
    }
    
    func setupTabBarViewControllers() {
        
        let first = DefaultTabBarController()
        let firstIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        first.tabBarItem = firstIcon
        
        let second = DefaultTabBarController()
        let secondIcon = UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        second.tabBarItem = secondIcon
        
        let third = UINavigationController(rootViewController: AlbumViewController())
        let thirdIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        third.tabBarItem = thirdIcon
        
        let fourth = DefaultTabBarController()
        let fourthIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        fourth.tabBarItem = fourthIcon
        
        let controllers = [first, second, third, fourth]
        self.setViewControllers(controllers, animated: true)
    }
    
    func tabBarController(_tabBarContoller: UITabBarController, shouldSelect viewController: UIViewController)-> Bool{
        return true
    }
}
