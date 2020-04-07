//
//  JsonLoaderHandler.swift
//  SocialDistancing
//
//  Created by AndreaRov on 07/04/2020.
//

import Foundation

final class JsonLoaderHandler: JsonLoader {
    
    private let resourceName: String
    private let fileExtension: String
    
    enum Error: Swift.Error {
        case invalidPath, invalidJson
    }
    
    init(resourceName: String = "news", fileExtension: String = "json") {
        self.resourceName = resourceName
        self.fileExtension = fileExtension
    }
    
    func get(completion: @escaping (JsonLoaderResult) -> Void) {
        
        if let path = Bundle.main.path(forResource: resourceName, ofType: fileExtension) {
            
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                completion(.success(jsonData))
            } catch {
                completion(.failure(Error.invalidJson))
            }
            
            
            
        } else {
            completion(.failure(Error.invalidPath))
        }
    }
    
}
