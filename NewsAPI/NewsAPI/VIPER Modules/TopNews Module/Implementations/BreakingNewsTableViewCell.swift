//
//  BreakingNewsTableViewCell.swift
//  NewsAPI
//
//  Created by Марк Киричко on 20.11.2022.
//

import UIKit

class BreakingNewsTableViewCell: UITableViewCell {
    
    static let identifier = "BreakingNewsTableViewCell"
    
    var ArticleImage = UIImageView()
    let ArticleTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        return label
    }()
    var ArticleDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(ArticleTitle)
        self.addSubview(ArticleImage)
        ArticleImage.translatesAutoresizingMaskIntoConstraints = false
        ArticleImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ArticleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        ArticleImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        ArticleImage.widthAnchor.constraint(equalTo: ArticleImage.heightAnchor, multiplier: 16/9).isActive = true
        
        ArticleTitle.translatesAutoresizingMaskIntoConstraints = false
        ArticleTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ArticleTitle.leadingAnchor.constraint(equalTo: ArticleImage.trailingAnchor, constant: 20).isActive = true
        ArticleTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
        ArticleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func configure(news: TopNewsViewModel) {
        ArticleTitle.text = news.title
        ArticleImage.load(urlString: news.image)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
