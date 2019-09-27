//
// Created by 明扬 on 2019/9/27.
//

import Foundation
import os.log

class Log {
    let tag: OSLog?
    let category: String

    init(subsystem: String, category: String) {
        self.category = category
        if #available(iOS 10.0, macOS 10.12, *) {
            self.tag = OSLog(subsystem: subsystem, category: category)
        } else {
            self.tag = nil
        }
    }

    func debug(_ log: String) {
        if #available(iOS 10.0, macOS 10.12, *) {
            os_log("%@", log: tag!, type: .debug)
        } else {
            NSLog("[DEBUG]-%@: %@", category, log)
        }
    }
    func info(_ log: String) {
        if #available(iOS 10.0, macOS 10.12, *) {
            os_log("%@", log: tag!, type: .info)
        } else {
            NSLog("[INFO]-%@: %@", category, log)
        }
    }
    func error(_ log: String) {
        if #available(iOS 10.0, macOS 10.12, *) {
            os_log("%@", log: tag!, type: .error)
        } else {
            NSLog("[ERROR]-%@: %@", category, log)
        }
    }
    func fatal(_ log: String) {
        if #available(iOS 10.0, macOS 10.12, *) {
            os_log("%@", log: tag!, type: .fault)
        } else {
            NSLog("[FATAL]-%@: %@", category, log)
        }
    }
    func print(_ log: String) {
        if #available(iOS 10.0, macOS 10.12, *) {
            os_log("%@", log: tag!, type: .default)
        } else {
            NSLog("[DEFAULT]-%@: %@", category, log)
        }
    }
}

