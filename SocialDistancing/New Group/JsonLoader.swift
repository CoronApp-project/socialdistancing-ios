//
//  JsonHandler.swift
//  SocialDistancing
//
//  Created by AndreaRov on 06/04/2020.
//

import Foundation

enum JsonLoaderResult {
    case success(Data)
    case failure(Error)
}

protocol JsonLoader {
    func get(completion: @escaping (JsonLoaderResult) -> ())
}
