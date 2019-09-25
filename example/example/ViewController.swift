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

class ViewController: UIViewController {

    @IBOutlet weak var zhaohufb: ZhaohuFloatingButton!
    private let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "Screen")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        os_log("demo start!", log: log, type: .info)
        zhaohufb.parentViewController = self
        
        if self.navigationController == nil {
            os_log("???", log: log, type: .debug)
        }
    }
}

enum MyError: Error {
    case nani
}
