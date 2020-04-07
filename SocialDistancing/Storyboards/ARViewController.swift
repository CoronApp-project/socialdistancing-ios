//
//  ARViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import UIKit
import ARKit

class ARViewController: UIViewController {
    
    @IBOutlet weak var questionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionButton.addTarget(self, action: #selector(didPressQuestionMarkButton), for: .touchUpInside)
        debugPrint(firstTimeAppLaunches)
    }
    
    @objc func didPressQuestionMarkButton() {
        self.navigateToOnboarding()
    }

}
