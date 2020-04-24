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
        
        let jsonLoader = JsonLoaderHandler(resourceName: "news", fileExtension: "json")
        let newsLoader = NewsLoaderManager(jsonLoader: jsonLoader)
        
        let firstVC = NewsViewController(newsLoader: newsLoader)
        let secondVC = ARViewController()
        let onboardingVC = OnboardingViewController()
        let thirdVC = OnboardingViewController()
        
        let tabOneBarItem = UITabBarItem(title: "News", image: UIImage(named: "newspaper"), selectedImage: UIImage(named: "newspaperSelected"))
        let tabTwoBarItem = UITabBarItem(title: "Start", image: UIImage(), selectedImage: UIImage())
        let tabThreeBarItem = UITabBarItem(title: "Help", image: UIImage(named: "question"), selectedImage: UIImage(named: "questionSelected"))
            
        firstVC.tabBarItem = tabOneBarItem
        secondVC.tabBarItem = tabTwoBarItem
        thirdVC.tabBarItem = tabThreeBarItem
        self.viewControllers = [firstVC, secondVC, thirdVC]
        
        self.selectedIndex = 1
        
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 61, height: 61))
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 20
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame

        menuButton.backgroundColor = UIColor.black
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)

        menuButton.setImage(UIImage(named: "arview"), for: .normal)
        menuButton.addTarget(self, action: #selector(MenuTabBarController.arButtonAction), for: .touchUpInside)
        
        menuButton.imageView?.layer.removeAllAnimations()

        view.layoutIfNeeded()
    }
    
    @objc func arButtonAction() {
        self.selectedIndex = 1
    }
}

// NearbyDetectionViewController()
//        let tabTwoBarItem3 = UITabBarItem(title: "Bluetooth", image: UIImage(), selectedImage: UIImage())
