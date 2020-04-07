//
//  NewsLoader.swift
//  SocialDistancing
//
//  Created by AndreaRov on 07/04/2020.
//

import Foundation

enum LoadNewsResult {
    case success([News])
    case failure(Error)
}

protocol NewsLoader {
    func load(completion: @escaping (LoadNewsResult) -> Void)
}
