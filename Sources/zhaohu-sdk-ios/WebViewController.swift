//
//  WebViewController.swift
//  zhaohu-sdk-ios
//
//  Created by 明扬 on 2019/9/4.
//

import UIKit
import os.log
import WebKit

public class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    fileprivate let p: ZhaohuParameter
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? String {
            os_log("老王坑我: %@", log: log, type: .debug, body)
        }
        if let body = message.body as? [String: Any], let type = body["type"] as? String {
            
            switch type {
            case "USER_INFO_REQUEST":
                if let callback = body["callback"] as? String {
                    p.requestUserInfoDelegate.requestUserInfo(callback: {
                        let script = WKUserScript(source: "\(callback)(\($0))", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
                        webView.configuration.userContentController.addUserScript(script)
                    })
                } else {
                    os_log("???callback???", log: log, type: .error)
                }
            case "USER_INFO_REPLY":
                os_log("%@", log: log, type: .error, body.description)
            case "USER_DENIED":
                self.dismiss(animated: true)
            default:
                os_log("Unrecognizable type: %@\n%@", log: log, type: .error, type, body.description)
            }
        }
    }
    
    public init(p: ZhaohuParameter) {
        self.p = p
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
        // Do any additional setup after loading the view.
        
        webView.configuration.userContentController.add(self, name: "agora")
        var versionSpan = ""
        if let version = p.version {
            versionSpan = "version=\(version)"
        }
        
        let url = URL(string: "https://agora.\(p.env ?? "mesoor").com/?\(versionSpan)&token=\(p.token)&from=\(p.from)&platform=ios_sdk")
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


public protocol RequestUserInfoDelegate {
    func requestUserInfo(callback: (_ result: String) -> Void) -> Void
}
