//
//  MainViewController.swift
//  SocialDistancing
//
//  Created by andrea roveres on 02/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let onboarding = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
        
        self.present(onboarding, animated: true, completion: nil)
    }
    
    
}
