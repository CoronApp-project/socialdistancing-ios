//
//  UIViewController+firstLaunch.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import UIKit

extension UIViewController {
    
    var firstTimeAppLaunches: Bool {
        
        if UserDefaults.standard.bool(forKey: "appLaunchesFirstTime") {
            return false
        }
        return true
    }
    
    func firstTimeAppLaunches(_ firstTime: Bool) {
        if !firstTime {
            UserDefaults.standard.set(true, forKey: "appLaunchesFirstTime")
        }
    }
}
