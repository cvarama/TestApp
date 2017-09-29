//
//  HanumanChalisaVCViewController.swift
//  SidebarMenu
//
//  Created by Sivarama Arepu on 29/09/17.
//  Copyright © 2017 SRK. All rights reserved.
//

import UIKit
import WebKit

class HanumanChalisaVCViewController: UIViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.loadPdf()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Load Pdf
    func loadPdf() {
        if let pdfURL = Bundle.main.url(forResource: "Sri_Hanuman_Chalisa_Hindi", withExtension: "pdf", subdirectory: nil, localization: nil)  {
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
