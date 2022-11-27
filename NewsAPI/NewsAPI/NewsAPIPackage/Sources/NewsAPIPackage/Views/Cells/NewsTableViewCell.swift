//
//  NewsTableViewCell.swift
//  NewsAPI
//
//  Created by Марк Киричко on 20.11.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
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
    
    func configure(title: String, image: String) {
        ArticleTitle.text = title
        DispatchQueue.main.async {
            ImageService.getImage(withURL: (URL(string: image) ?? URL(string: "https://i.pinimg.com/originals/8a/eb/d8/8aebd875fbddd22bf3971c3a7159bdc7.png"))!, completion: { image in
                self.ArticleImage.image = nil
                self.ArticleImage.image = image
            })
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
