//
//  BreakingNewsView.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

class BreakingNewsView: UIViewController {
    
    var presenter: TopNewsPresenter?
    var news = [TopNewsViewModel]()
    var tableView = UITableView()
    var spinner = UIActivityIndicatorView(style: .large)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Главное"
        self.tabBarItem.image = UIImage(systemName: "flame")
        UITabBar.appearance().tintColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BreakingNewsTableViewCell.self, forCellReuseIdentifier: BreakingNewsTableViewCell.identifier)
        tableView.rowHeight = 100
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension BreakingNewsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreakingNewsTableViewCell.identifier, for: indexPath) as! BreakingNewsTableViewCell
        cell.configure(news: news[indexPath.row])
        return cell
    }
}


extension BreakingNewsView: TopNewsView {
    
    func displayTopNews(news: [TopNewsViewModel]) {
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
}
