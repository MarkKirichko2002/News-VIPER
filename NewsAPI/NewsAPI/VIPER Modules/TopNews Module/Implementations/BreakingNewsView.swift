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
    var news = [NewsViewModel]()
    var dbnews = [NewsDB]()
    var tableView = UITableView()
    var spinner = UIActivityIndicatorView(style: .large)
    var count = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Главное"
        self.tabBarItem.image = UIImage(systemName: "flame")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.LoadFromDB()
        view.backgroundColor = .white
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

extension BreakingNewsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if news.isEmpty {
            return dbnews.count
        } else {
            return news.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        if !news.isEmpty {
            cell.configure(title: news[indexPath.row].title, image: news[indexPath.row].image)
        }else {
            cell.configure(title: dbnews[indexPath.row].title ?? "", image: dbnews[indexPath.row].image ?? "")
        }
        
        cell.configure(title: dbnews[indexPath.row].title ?? "", image: dbnews[indexPath.row].image ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.GoToWeb(url: news[indexPath.row].url)
    }
}

extension BreakingNewsView: TopNewsView {
    
    func displayTopNews(news: [NewsViewModel]) {
        DispatchQueue.main.async {
            self.news = news
            self.tableView.reloadData()
            self.count = self.news.count
            self.navigationItem.title = "Главное \(self.count) новостей"
            self.spinner.stopAnimating()
        }
    }
    
    func displayTopNewsFromDB(news: [NewsDB]) {
        DispatchQueue.main.async {
            self.dbnews = news
            self.tableView.reloadData()
            self.count = self.dbnews.count
            self.navigationItem.title = "Главное \(self.count) новостей"
            self.spinner.stopAnimating()
            print(self.dbnews)
        }
    }
}
