//
//  NewsLoaderManager.swift
//  SocialDistancing
//
//  Created by AndreaRov on 07/04/2020.
//

import Foundation

final class NewsLoaderManager: NewsLoader {
    
    enum Error: Swift.Error {
        case invalidMapper, invalidData
    }
    
    public typealias Result = NewsLoadResult
    
    private let jsonLoader: JsonLoader
    
    init(jsonLoader: JsonLoader) {
        self.jsonLoader = jsonLoader
    }
    
    func load(completion: @escaping (NewsLoadResult) -> Void) {
        
        jsonLoader.get { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(data):
                completion(NewsItemMapper.map(data))
            case .failure:
                completion(.failure(Error.invalidData))
            }
        }
        
        
        
    }
}
