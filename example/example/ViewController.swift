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
        
        let p = ZhaohuParameter(from: "test", token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcm9tIjoidGVzdCIsImlkIjoicnVhcnVhLTIwMTMiLCJpYXQiOjE1NzA4NzE0MTQsImV4cCI6MTU3MzQ2MzQxNH0.2ErwbsM90aC004fZEltTJjTjPtFJT7t_9vFySVeLuDw", requestUserInfoDelegate: self)
        zhaohufb.initialize(p: p)
        zhaohufb.parentViewController = self
        
        if self.navigationController == nil {
            os_log("???", log: log, type: .debug)
        }
    }
    
    public func requestUserInfo(callback: (String) -> Void) {
        callback("""
        {"eval":"活泼开朗，善于表达，吃苦耐劳，学习能力强，积极向上。","basic":{"name":"麦萌","email":"support@mesoor.com","phone":"12345678901","gender":"女","birthday":"1970-01-01","location":{"city":"上海"},"locationId":310000},"works":[{"end_date":"2017-05-19T16:00:00.000Z","position":"产品运营","department":"产品运营部","industry":"1063","salary_low":4001,"salary_high":6000,"until_now":true,"start_date":"2017-02-28T16:00:00.000Z","description":"\\n· 从测试版上线至今,麦萌一直努力了解每一个职位的岗位职责和具体要求;\\n· 麦萌努力收集每一位主动应聘者,运用统一客观公允的标准筛选每一份简历,帮助企业招聘专员避免遗珠之憾;\\n· 麦萌负责收集整理自有简历库中的沉淀人才,检索潜在适合的候选人;\\n· 麦萌负责为高匹配的候选人协调安排面试,根据候选人的时间安排随时随地进行视频面试;\\n· 麦萌负责采集候选人视频面试表现,分析候选人的职责匹配程度,胜任素质潜力和职业性格,优化企业招聘流程。\\n","company":"麦穗人工智能"}],"skills":[],"awards":[],"version":1,"projects":[],"educations":[{"major":"教育","degree":"学术型硕士","school":"****大学","end_date":"2016-07-01T00:00:00.000Z","start_date":"2013-09-01T00:00:00.000Z"}],"expectation":{"locationIds":[310000],"salary_high":6000,"salary_low":4001,"exclude":{"companies":[],"industries":[],"work_types":[]}},"skills_text":"不眠不休,兢兢业业"}
        """)
    }
}

enum MyError: Error {
    case nani
}
