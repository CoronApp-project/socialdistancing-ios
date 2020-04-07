//
//  CustomPrint.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.

import Foundation

func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    fatalError("Use debugPrint instead!!")
    #endif
}
