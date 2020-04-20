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
        
        let tabOneBarItem = UITabBarItem(title: "News", image: UIImage(named: "newspaper"), selectedImage: UIImage(named: "newspaperSelected"))
        let tabTwoBarItem = UITabBarItem(title: "Start", image: UIImage(named: "arview"), selectedImage: UIImage(named: "arview"))
        let tabThreeBarItem = UITabBarItem(title: "Help", image: UIImage(named: "question"), selectedImage: UIImage(named: "questionSelected"))
            
        firstVC.tabBarItem = tabOneBarItem
        secondVC.tabBarItem = tabTwoBarItem
        thirdVC.tabBarItem = tabThreeBarItem
        self.viewControllers = [firstVC, secondVC, thirdVC]
        
        self.selectedIndex = 1
    }
    
    
}

// NearbyDetectionViewController()
//        let tabTwoBarItem3 = UITabBarItem(title: "Bluetooth", image: UIImage(), selectedImage: UIImage())
