//
//  NewsItemMapper.swift
//  SocialDistancing
//
//  Created by AndreaRov on 07/04/2020.
//

import Foundation

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
        //TODO: filter by country
//        let countryNews = arrNews.filter { $0.locale.lowercased() == Locale.current.languageCode }
        
        return .success(arrNews)
    }
}
