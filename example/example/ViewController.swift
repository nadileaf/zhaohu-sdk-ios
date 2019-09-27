//
//  ViewController.swift
//  example
//
//  Created by 明扬 on 2019/8/28.
//  Copyright © 2019 明扬. All rights reserved.
//

import UIKit
import os.log

import zhaohu_sdk_ios
import MaterialComponents.MaterialButtons

class ViewController: UIViewController, RequestUserInfoDelegate {

    @IBOutlet weak var zhaohufb: ZhaohuFloatingButton!
    private let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "Screen")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        os_log("demo start!", log: log, type: .info)
        
        let p = ZhaohuParameter(from: "test", token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InJ1YXJ1YXJ1YSIsImZyb20iOiJ0ZXN0IiwiaWF0IjoxNTYwODI1Mjc3LCJleHAiOjE2MjM4OTcyNjV9.fHKbDJtHZJZhq0PI7e9jHsfxCuhEy3Wxf1BIj5egAtY", requestUserInfoDelegate: self, env: "nadileaf", version: "ccf371cc")
        zhaohufb.initialize(p: p)
        zhaohufb.parentViewController = self
        
        if self.navigationController == nil {
            os_log("???", log: log, type: .debug)
        }
    }
    
    public func requestUserInfo(callback: (String) -> Void) {
        callback("{}")
    }
}

enum MyError: Error {
    case nani
}
