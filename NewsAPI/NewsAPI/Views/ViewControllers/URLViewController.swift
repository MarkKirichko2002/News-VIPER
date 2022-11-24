//
//  URLViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 20.11.2022.
//

import UIKit
import WebKit

class URLViewController: UIViewController {

    var WVWEBview = WKWebView()
    var spinner = UIActivityIndicatorView(style: .large)
   
    var url = "http://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(WVWEBview)
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        WVWEBview.frame = view.bounds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let request = URLRequest(url: URL(string: self.url)!)
            self.WVWEBview.load(request)
            self.spinner.stopAnimating()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
