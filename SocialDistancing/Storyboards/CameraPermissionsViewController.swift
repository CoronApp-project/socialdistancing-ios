//
//  CameraPermissionsViewController.swift
//  SocialDistancing
//
//  Created by andrea roveres on 02/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import UIKit
import AVFoundation

final class CameraPermissionsViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var noButton: BlueButton!
    @IBOutlet weak var okButton: BlueButton!
    
    private var isFirstTimeAsked: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "For this app to work, we need to access your camera. That cool?"
        noButton.setTitle("Nope", for: .normal)
        okButton.setTitle("OK!", for: .normal)
        noButton.style = .white
        okButton.style = .blue
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
                    nextViewController.isFirstTimeShowing = true
                    
                    DispatchQueue.main.async {
                        self.getTopMostViewController()?.present(nextViewController, animated: false, completion: nil)
                    }
                } else {
                    
                    DispatchQueue.main.async {
                        let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "menu") as! MenuViewController
                        nextViewController.modalPresentationStyle = .fullScreen
                        self.getTopMostViewController()?.present(nextViewController, animated: false, completion: nil)
                    }
                }
                
            case .notDetermined, .denied, .restricted:
                
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        
                        if self.isFirstTimeOpening() {

                            DispatchQueue.main.async {
                                let nextViewController = OnboardingViewController()
                                nextViewController.modalPresentationStyle = .fullScreen
                                nextViewController.isFirstTimeShowing = true
                                self.getTopMostViewController()?.present(nextViewController, animated: false, completion: nil)
                            }
                        } else {
                            DispatchQueue.main.async {
                                let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "menu") as! MenuViewController
                                nextViewController.modalPresentationStyle = .fullScreen
                                self.getTopMostViewController()?.present(nextViewController, animated: false, completion: nil)
                            }
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                        self.showPhoneSettings()
                        }
                    }
                }
//            case .denied, .restricted:
//                showPhoneSettings()
//                return
                
            @unknown default:
                fatalError()
            }
            
        }
    
    
    private func showPhoneSettings() {
        let alertController = UIAlertController(title: "Permission Error", message: "Permission denied, please allow our app permission through Settings in your phone if you want to use our service.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        alertController.addAction(UIAlertAction(title: "Settings", style: .cancel) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                    /// Handle user opened phone Settings
                })
            }
        })
        
        present(alertController, animated: true)
    }
    
    
    @IBAction func didPressCancelButton(_ sender: Any) {
        
        if isFirstTimeAsked {
            messageLabel.text = "Are you sure? You’ll miss what this awesome app has to show you"
            noButton.setTitle("I am sure", for: .normal)
            okButton.setTitle("OK, access camera", for: .normal)
            isFirstTimeAsked = false
        } else {
            okButton.isHighlighted = true
        }
    }
    
    
    @IBAction func didPressAceptButton(_ sender: Any) {
        cammeraPermissions()
    }
    
}
