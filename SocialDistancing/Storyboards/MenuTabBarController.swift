//
//  MenuTabBarController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 03/04/2020.
//

import UIKit

final class MenuTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        firstTimeAppLaunches(false)
        
        //TODO: ??
        let jsonLoader = JsonLoaderHandler(resourceName: "news", fileExtension: "json")
        let newsLoader = NewsLoaderManager(jsonLoader: jsonLoader)
        
        let firstVC = NewsViewController(newsLoader: newsLoader)
        let secondVC = ARViewController()
        let onboardingVC = OnboardingViewController()
        let thirdVC = OnboardingViewController()
        
        let tabOneBarItem = UITabBarItem(title: "News", image: UIImage(), selectedImage: UIImage())
        let tabTwoBarItem = UITabBarItem(title: "Start", image: UIImage(), selectedImage: UIImage())
        let tabThreeBarItem = UITabBarItem(title: "Help", image: UIImage(), selectedImage: UIImage())
            
        firstVC.tabBarItem = tabOneBarItem
        secondVC.tabBarItem = tabTwoBarItem
        thirdVC.tabBarItem = tabThreeBarItem
        self.viewControllers = [firstVC, secondVC, thirdVC]
    }
    
    
}

// NearbyDetectionViewController()
//        let tabTwoBarItem3 = UITabBarItem(title: "Bluetooth", image: UIImage(), selectedImage: UIImage())
