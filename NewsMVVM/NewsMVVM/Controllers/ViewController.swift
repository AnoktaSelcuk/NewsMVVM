//
//  ViewController.swift
//  NewsMVVM
//
//  Created by Alperen Selçuk on 22.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var articleListVM: ArticleListViewModel!
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "article-cell-reuse-identifier")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setup()
        layout()
        setNavigtionBarItems()
    }
}

extension ViewController {
    fileprivate func setup() {
//        tableview
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
//        web services
        let url = URL(string: ":)")!
        
        WebService().getArticles(url: url) { (articles) in
            
            guard let articles = articles else { return }
            self.articleListVM = ArticleListViewModel(articles: articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func layout() {
        view.addSubview(tableView)
        view = tableView
    }
    
    
    fileprivate func setNavigtionBarItems() {
        title = "First"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .gray
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
            
        } else {
//            Fallback on earlier versions
            navigationController?.navigationBar.barTintColor = .gray
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "article-cell-reuse-identifier", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found")}
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.label1.text = articleVM.title
        cell.label2.text = articleVM.description
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
