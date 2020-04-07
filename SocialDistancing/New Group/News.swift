//
//  News.swift
//  SocialDistancing
//
//  Created by AndreaRov on 07/04/2020.
//

import Foundation

struct News: Equatable {
    let locale: String
    let title: String
    let description: String
    let web: String
    let photo: String
    
    public init(locale: String, title: String, description: String, web: String, photo: String) {
        self.locale = locale
        self.title = title
        self.description = description
        self.web = web
        self.photo = photo
    }
}
