//
//  JsonHandler.swift
//  SocialDistancing
//
//  Created by andrea roveres on 06/04/2020.
//  Copyright © 2020 AndreaRov. All rights reserved.
//

import Foundation

public enum JsonLoaderResult {
    case success(Data)
    case failure(Error)
}

public protocol JsonLoader {
    func get(completion: @escaping (JsonLoaderResult) -> Void)
}

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

enum LoadNewsResult {
    case success([News])
    case failure(Error)
}

protocol NewsLoader {
    func load(completion: @escaping (LoadNewsResult) -> Void)
}


final class NewsLoaderManager: NewsLoader {
    
    enum Error: Swift.Error {
        case invalidMapper, invalidData
    }
    
    public typealias Result = LoadNewsResult
    
    private let jsonLoader: JsonLoader
    
    init(jsonLoader: JsonLoader) {
        self.jsonLoader = jsonLoader
    }
    
    func load(completion: @escaping (Result) -> Void) {
        
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

final class NewsItemMapper {
    
    private struct Item: Decodable {
        let locale: String
        let title: String
        let description: String
        let link: String
        let photoLink: String
        
        var item: News {
            return News(locale: locale, title: title, description: description, web: link, photo: photoLink)
        }
    }
    
    internal static func map(_ data: Data) -> NewsLoaderManager.Result {
        guard let root = try? JSONDecoder().decode([Item].self, from: data) else {
            return .failure(NewsLoaderManager.Error.invalidMapper)
        }

        let arrNews = root.map { return $0.item }
//        let countryNews = arrNews.filter { $0.locale.lowercased() == Locale.current.languageCode }
        
        return .success(arrNews)
    }
}
