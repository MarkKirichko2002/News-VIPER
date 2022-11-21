//
//  NewsCategoriesTableViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 21.11.2022.
//

import Foundation
import UIKit

class NewsCategoriesTableViewController: UIViewController {
    
    var tableView = UITableView()
    
    var presenter: CategoriesPresenter?
    
    var categories = [NewsCategory(id: 1, name: "главное"), NewsCategory(id: 2, name: "технологии"),NewsCategory(id: 3, name: "спорт"), NewsCategory(id: 5, name: "бизнес"), NewsCategory(id: 6, name: "развлечения")]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Категории"
        self.tabBarItem.image = UIImage(systemName: "newspaper")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NewsCategoriesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }
}

extension NewsCategoriesTableViewController: CategoriesView {
    
}
