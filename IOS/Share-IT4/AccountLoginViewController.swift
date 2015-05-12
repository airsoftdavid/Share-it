//
//  AccountLoginViewController.swift
//  Share-IT4
//
//  Created by David Chen on 5/8/15.
//  Copyright (c) 2015 David Chen. All rights reserved.
//

import Foundation
import UIKit

class AccountLoginViewController: UIViewController {
    
    let url = "https://rcos-share-it.herokuapp.com"
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.scrollView.scrollEnabled = true;
        webView.scalesPageToFit = true;
        webView.loadRequest(request)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

