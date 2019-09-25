//
//  WebViewController.swift
//  zhaohu-sdk-ios
//
//  Created by 明扬 on 2019/9/4.
//

import UIKit
import os.log
import WebKit

public class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    public init() {
        super.init(nibName: "WebViewController", bundle: Bundle.main)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "component")
    
    @IBOutlet weak var webView: WKWebView! {
      didSet {
        webView.uiDelegate = self
        webView.navigationDelegate = self
      }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        os_log("subviews: %@", log: log, type: .debug, self.view.subviews.description)
        // Do any additional setup after loading the view.
        let url = URL(string: "https://agora.nadileaf.com/?version=a25a479f&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InJ1YXJ1YXJ1YSIsImZyb20iOiJ0ZXN0IiwiaWF0IjoxNTYwODI1Mjc3LCJleHAiOjE2MjM4OTcyNjV9.fHKbDJtHZJZhq0PI7e9jHsfxCuhEy3Wxf1BIj5egAtY&from=test&platform=ios_sdk#/discover")
        let req = URLRequest(url: url!)
        if let webView = self.webView {
            webView.load(req)
        } else {
            os_log("webView not found! please check xib resource is exists.", log: log, type: .fault)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

enum SDKError: Error {
    case FatalError(reason: String)
}
