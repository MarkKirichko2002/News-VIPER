//
//  URLViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 20.11.2022.
//

import UIKit
import WebKit

class URLViewController: UIViewController {

    var WVWEBview = UIWebView()
   
    var url = "http://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(WVWEBview)
        WVWEBview.frame = view.bounds
        DispatchQueue.main.async {
            let request = URLRequest(url: URL(string: self.url)!)
            self.WVWEBview.loadRequest(request)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
