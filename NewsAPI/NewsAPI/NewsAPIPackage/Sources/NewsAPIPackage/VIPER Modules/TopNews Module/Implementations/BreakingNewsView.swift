//
//  BreakingNewsView.swift
//  VIPER best practices
//
//  Created by Марк Киричко on 19.11.2022.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
public class BreakingNewsView: UIViewController {
    
    var presenter: TopNewsPresenter?
    var news = [NewsViewModel]()
    var dbnews = [NewsDB]()
    var tableView = UITableView()
    var spinner = UIActivityIndicatorView(style: .large)
    var count = 0
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Главное"
        self.tabBarItem.image = UIImage(systemName: "flame")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
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

@available(iOS 13.0, *)
extension BreakingNewsView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if news.isEmpty {
            return dbnews.count
        } else {
            return news.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        if !news.isEmpty {
            cell.configure(title: news[indexPath.row].title, image: news[indexPath.row].image)
        } else {
            cell.configure(title: dbnews[indexPath.row].title ?? "", image: dbnews[indexPath.row].image ?? "")
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
               cell.didSelect(indexPath: indexPath)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.GoToWeb(url: self.news[indexPath.row].url)
        }
    }
}

@available(iOS 13.0, *)
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
        }
    }
}
