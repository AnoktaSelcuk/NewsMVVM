//
//  ArticleViewModel.swift
//  NewsMVVM
//
//  Created by Alperen Selçuk on 22.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import Foundation

//Article List View Model
struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        
        return ArticleViewModel(article)
    }
}

//Article View Model
struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
