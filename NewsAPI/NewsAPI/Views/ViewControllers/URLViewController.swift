//
//  URLViewController.swift
//  NewsAPI
//
//  Created by Марк Киричко on 20.11.2022.
//

import UIKit
import WebKit

class URLViewController: UIViewController {

    @IBOutlet weak var WVWEBview: WKWebView!
   
    var url = "http://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            let request = URLRequest(url: URL(string: "http://www.apple.com")!)
            self.WVWEBview.load(request)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
