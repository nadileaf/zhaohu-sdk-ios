//
//  ZhaohuFloatingButton.swift
//  zhaohu-sdk-ios
//
//  Created by 明扬 on 2019/8/28.
//

import UIKit
import MaterialComponents.MaterialButtons
import os.log

@IBDesignable open class ZhaohuFloatingButton: MDCFloatingButton {
    fileprivate var canDrag = false
    fileprivate let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "component")
    
    public weak var parentViewController: UIViewController?
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }


    let plusImage = UIImage(named: "mesoor-round-logo.png")

    public func setup() {
        os_log("setup", log: log, type: .info)
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(plusImage, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.accessibilityLabel = "Create"
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let alert = UIAlertController(title: "???", message: "!!!", preferredStyle: UIAlertController.Style.alert)
//        self.container?.present(alert, animated: true, completion: nil)
//
        let webViewController = WebViewController()
//        self.parentViewController?.navigationController?.pushViewController(webViewController, animated: true)
        self.parentViewController?.present(webViewController, animated: true)
        super.touchesBegan(touches, with: event)
    }
}
