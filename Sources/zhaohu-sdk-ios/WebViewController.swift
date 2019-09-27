//
//  WebViewController.swift
//  zhaohu-sdk-ios
//
//  Created by 明扬 on 2019/9/4.
//

import UIKit
import WebKit

public class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    fileprivate let logger = Log(subsystem: Bundle.main.bundleIdentifier!, category: "WebViewBridge")
    fileprivate let p: ZhaohuParameter
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? [String: Any], let type = body["type"] as? String {
            
            switch type {
            case "USER_INFO_REQUEST":
                if let callback = body["callback"] as? String {
                    p.requestUserInfoDelegate.requestUserInfo(callback: {
                        webView.evaluateJavaScript("\(callback)(\($0))", completionHandler: nil)
                    })
                } else {
                    logger.error("???callback???")
                }
            case "USER_INFO_REPLY":
                logger.error(body.description)
            case "USER_DENIED":
                self.dismiss(animated: true)
            default:
                logger.error(String(format: "Unrecognizable type: %@\n%@", type, body.description))
            }
        } else {
            logger.fatal(String(format: "老王坑我: %@", String(describing: message.body)))
        }
    }
    
    public init(p: ZhaohuParameter) {
        self.p = p
        super.init(nibName: "WebViewController", bundle: Bundle.main)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
            logger.fatal("webView not found! please check xib resource is exists.")
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
