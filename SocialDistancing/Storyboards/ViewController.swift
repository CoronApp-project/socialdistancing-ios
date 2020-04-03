//
//  ViewController.swift
//  SocialDistancing
//
//  Created by andrea roveres on 02/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var tutorialButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressTutorialButton(_ sender: Any) {
 
        self.performSegue(withIdentifier: "navigateToTutorial", sender: nil)
    }
}


extension UIViewController {
    
    func getTopMostViewController() -> UIViewController? {
        
        var topMostViewController = UIApplication.shared.keyWindowInConnectedScenes?.rootViewController
        
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        
        return topMostViewController
    }
    
}

extension UIApplication {

    /// The app's key window taking into consideration apps that support multiple scenes.
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }

}
