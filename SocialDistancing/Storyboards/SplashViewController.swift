//
//  MainViewController.swiftSplashViewController
//  SocialDistancing
//
//  Created by andrea roveres on 02/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit
import AVFoundation

final class SplashViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cammeraPermissions()
    }
    
    private func isFirstTimeOpening() -> Bool {
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: "hasBeenLaunchedBeforeFlag") == false {
            defaults.set(true, forKey: "hasBeenLaunchedBeforeFlag")
            return true
        }
        return false
    }
    
    
    private func cammeraPermissions() {
        
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch authStatus {
        case .authorized:
            
            if isFirstTimeOpening() {
                let nextViewController = OnboardingViewController()
                nextViewController.modalPresentationStyle = .fullScreen
                
                DispatchQueue.main.async {
                    self.getTopMostViewController()?.present(nextViewController, animated: false, completion: nil)
                }
            } else {
                
                DispatchQueue.main.async {
                    self.getTopMostViewController()?.performSegue(withIdentifier: "splashToMenu", sender: nil)
                }
            }
        default:
            let nextViewController = CameraPermissionsViewController()
            nextViewController.modalPresentationStyle = .fullScreen
            DispatchQueue.main.async {
                self.getTopMostViewController()?.present(nextViewController, animated: false, completion: nil)
            }
        }
    }
    
}
