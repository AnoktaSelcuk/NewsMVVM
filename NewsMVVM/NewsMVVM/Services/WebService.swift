//
//  WebService.swift
//  NewsMVVM
//
//  Created by Alperen Selçuk on 22.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)

                if let articleList = articleList {
                    completion(articleList.articles)
                }
//                print(articleList?.articles)
            }
        }.resume()
    }
}
