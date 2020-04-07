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
        firstTimeAppLaunches(false)
        
        self.delegate = self
        
        //TODO: shouldnt be here
        let jsonLoader = JsonLoaderHandler(resourceName: "news", fileExtension: "json")
        let newsLoader = NewsLoaderManager(jsonLoader: jsonLoader)
        
        let firstVC = NewsViewController(newsLoader: newsLoader)
        let secondVC = ARViewController()
        let tabOneBarItem = UITabBarItem(title: "News", image: UIImage(), selectedImage: UIImage())
        let tabTwoBarItem2 = UITabBarItem(title: "AR", image: UIImage(), selectedImage: UIImage())
        
        firstVC.tabBarItem = tabOneBarItem
        secondVC.tabBarItem = tabTwoBarItem2
        self.viewControllers = [firstVC, secondVC]
        
        debugPrint(Locale.current.languageCode)
    }
    
    
}
