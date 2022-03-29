//
//  ArticleTableViewCell.swift
//  NewsMVVM
//
//  Created by Alperen Selçuk on 22.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    static let reuseIndentifier = "article-cell-reuse-identifier"
    
    let label1 = UILabel()
    let label2 = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        
        label1.text = "label1"
        label1.font = UIFont.systemFont(ofSize: 16)
        label1.numberOfLines = 0
        label1.lineBreakMode = .byTruncatingTail
        
        label2.text = "label2"
        label2.numberOfLines = 0
        label2.lineBreakMode = .byTruncatingTail
        
        contentView.addSubview(label1)
        contentView.addSubview(label2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticleTableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label1.frame = CGRect(x: 5,
                              y: 10,
                              width: contentView.frame.size.width,
                              height: contentView.frame.size.height / 2)
        
        label2.frame = CGRect(x: 5,
                              y: 40 + label1.intrinsicContentSize.height,
                              width: contentView.frame.size.width,
                              height: contentView.frame.size.height / 2)
    }
}
