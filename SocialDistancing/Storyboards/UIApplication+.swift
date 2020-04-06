//
//  UIApplication+.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import UIKit

extension UIApplication {
    
    /** The app's key window taking into consideration apps that support multiple scenes. */
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
    
}
