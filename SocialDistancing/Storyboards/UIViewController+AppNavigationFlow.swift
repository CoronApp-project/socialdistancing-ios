//
//  UIViewController+NavigationFlow.swift
//  SocialDistancing
//
//  Created by AndreaRov on 04/04/2020.
//

import UIKit

extension UIViewController {
    
    var topMostViewController: UIViewController? {
        
        var topMostViewController = UIApplication.shared.keyWindowInConnectedScenes?.rootViewController
        
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        return topMostViewController
    }
    
    func navigateToOnboarding(modalPresentationStyle: UIModalPresentationStyle = .automatic) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let onboardingViewController = OnboardingViewController()
                  onboardingViewController.modalPresentationStyle = modalPresentationStyle
            self.present(onboardingViewController, animated: true, completion: nil)
        }
    }
    
    func navigateToMenu(modalPresentationStyle: UIModalPresentationStyle = .automatic) {
        
        DispatchQueue.main.async { [weak self] in
            let nextViewController = MenuTabBarController()
            nextViewController.modalPresentationStyle = modalPresentationStyle
            self?.topMostViewController?.present(nextViewController, animated: false, completion: nil)
        }
    }
    
    func navigateToCameraPermissions() {
        DispatchQueue.main.async { [weak self] in
            let nextViewController = CameraPermissionsViewController()
            nextViewController.modalPresentationStyle = .fullScreen
            self?.topMostViewController?.present(nextViewController, animated: false, completion: nil)
        }
    }
}
