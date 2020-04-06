//
//  SplashViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 02/04/2020.
//

import UIKit
import AVFoundation

final class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationFlow()
    }
    
    private func setNavigationFlow() {
        
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        guard authStatus == .authorized else {
            navigateToCameraPermissions()
            return
        }
        
        navigateToMenu(modalPresentationStyle: .fullScreen)
    }
}
