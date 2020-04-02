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
