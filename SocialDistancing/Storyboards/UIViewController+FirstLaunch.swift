//
//  UIViewController+firstLaunch.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import UIKit

extension UIViewController {
    
    var firstTimeAppLaunches: Bool {
        
        if UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") == false {
            return true
        }
        return false
    }
    
    func firstTimeAppLaunches(_ firsTime: Bool) {
        UserDefaults.standard.set(firsTime, forKey: "hasBeenLaunchedBeforeFlag")
    }
}
