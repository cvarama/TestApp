//
//  ViewController.swift
//  SriApp
//
//  Created by Sivarama Arepu on 15/09/17.
//  Copyright © 2017 Sivarama Arepu. All rights reserved.
//

import UIKit
import WebKit

class SriVishnuViewController: UIViewController {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        loadPdf()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Load Pdf
    func loadPdf() {
        if let pdfURL = Bundle.main.url(forResource: "Sri_Vishnu", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                let webView = WKWebView(frame: CGRect(x:20,y:20,width:view.frame.size.width-40, height:view.frame.size.height-40))
                if #available(iOS 9.0, *) {
                    webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                } else {
                    // Fallback on earlier versions
                    print("not ios9.0", separator: "", terminator: "")
                }
                view.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
        }
    }


}

