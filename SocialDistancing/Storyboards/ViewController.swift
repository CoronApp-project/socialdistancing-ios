//
//  ViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 02/04/2020.
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
