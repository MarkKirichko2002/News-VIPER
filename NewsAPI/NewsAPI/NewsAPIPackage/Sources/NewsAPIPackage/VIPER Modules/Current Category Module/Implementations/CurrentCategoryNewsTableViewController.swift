//
//  CurrentCategoryNewsTableViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class CurrentCategoryNewsTableViewController: UIViewController {
    
    var presenter: CurrentCategoryPresenter?
    var category: NewsCategory?
    var tableView = UITableView()
    var news = [NewsViewModel]()
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = category?.name
        self.presenter?.reload()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.rowHeight = 100
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

@available(iOS 13.0, *)
extension CurrentCategoryNewsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.configure(title: news[indexPath.row].title, image: news[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.GoToWeb(url: news[indexPath.row].url)
    }
}

@available(iOS 13.0, *)
extension CurrentCategoryNewsTableViewController: CurrentCategoryView {
    
    func displayCurrentCategoryNews(news: [NewsViewModel]) {
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
}
