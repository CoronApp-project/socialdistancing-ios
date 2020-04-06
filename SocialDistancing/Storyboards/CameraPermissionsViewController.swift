//
//  CameraPermissionsViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 02/04/2020.
//

import UIKit
import AVFoundation

final class CameraPermissionsViewController: UIViewController {
    
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var noButton: BlueButton!
    @IBOutlet weak private var okButton: BlueButton!
    
    @IBOutlet weak var btnWidth: NSLayoutConstraint!
    private var highlightedActivated = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstScreenViewData()
        setupStyle()
    }
    
    //MARK: - IBAction
    
    @IBAction func didPressCancelButton(_ sender: Any) {
        btnWidth.constant = 177
        setupSecondScreenViewData()
        okButton.isHighlighted = highlightedActivated
        highlightedActivated = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else {debugPrint("CameraPermissionsViewController (=self) has been dealocated"); return}
            self.okButton.isHighlighted = false
        }
    }
    
    @IBAction func didPressAceptButton(_ sender: Any) {
        cammeraPermissions()
    }
    
    //MARK: - Setup view
    
    private func setupFirstScreenViewData() {
        messageLabel.text = "For this app to work, we need to access your camera. That cool?"
        noButton.setTitle("Nope", for: .normal)
        okButton.setTitle("OK!", for: .normal)
    }
    
    private func setupSecondScreenViewData() {
        messageLabel.text = "Are you sure? You’ll miss what this awesome app has to show you"
        noButton.setTitle("I am sure", for: .normal)
        okButton.setTitle("OK, access camera", for: .normal)
    }
    
    private func setupStyle() {
        noButton.style = .white
        okButton.style = .blue
    }
    
    //MARK: - Handle camera permissions
    
    private func cammeraPermissions() {
 
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .authorized:
            
            guard firstTimeAppLaunches else {
                self.navigateToMenu(modalPresentationStyle: .fullScreen)
                return
            }
            self.navigateToOnboarding(modalPresentationStyle: .fullScreen)
            
        case .notDetermined, .denied, .restricted:
            
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard let self = self else {debugPrint("CameraPermissionsViewController (=self) has been dealocated"); return}
                
                guard granted else {
                    DispatchQueue.main.async {
                        self.showPhoneSettings()
                    }
                    return
                }
                
                guard self.firstTimeAppLaunches else {
                    self.navigateToMenu(modalPresentationStyle: .fullScreen)
                    return
                }
                self.navigateToOnboarding(modalPresentationStyle: .fullScreen)
            }
            
        @unknown default:
            debugPrint("Unknown case")
            return
        }
        
    }
    
    
    private func showPhoneSettings() {
        let alertController = UIAlertController(title: "Permission Denied", message: "Please allow the app, through Settings, to access your camera if you want to use our services.", preferredStyle: .alert)
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
}
