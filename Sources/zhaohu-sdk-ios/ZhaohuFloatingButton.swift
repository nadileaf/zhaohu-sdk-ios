//
//  ZhaohuFloatingButton.swift
//  zhaohu-sdk-ios
//
//  Created by 明扬 on 2019/8/28.
//

import UIKit
import MaterialComponents.MaterialButtons

@IBDesignable public class ZhaohuFloatingButton: MDCFloatingButton {

    fileprivate var canDrag = false
    fileprivate let logger = Log(subsystem: Bundle(for: ZhaohuFloatingButton.self).bundleIdentifier!, category: "ZhaohuBtn")
    fileprivate var p: ZhaohuParameter? = nil
    @objc public weak var parentViewController: UIViewController?
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    public func setup() {
        logger.info("setup")

        self.canDrag = true
        let selfBundle = Bundle(identifier: "org.cocoapods.zhaohu-sdk-ios")!
        let plusImage = UIImage(named: "mesoor-round-logo.png", in: selfBundle, compatibleWith: nil)
        self.setImage(plusImage, for: .normal)

        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.contentMode = .scaleAspectFit
        self.accessibilityLabel = "Create"
    }

    public func initialize(p: ZhaohuParameter) {
        self.p = p
    }
    
    @objc public func setParameter(from: String, token: String, requestUserInfoDelegate: RequestUserInfoDelegate, env: String? = nil, version: String? = nil) {
        self.p = ZhaohuParameter(from: from, token: token, requestUserInfoDelegate: requestUserInfoDelegate, env: env, version: version)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let p = self.p else {
            fatalError("zhaohu need initialize")
        }
        let webViewController = WebViewController(p: p)
        if let nc = self.parentViewController?.navigationController {
            nc.pushViewController(webViewController, animated: true)
        } else {
            self.parentViewController?.present(webViewController, animated: true)
        }
        super.touchesBegan(touches, with: event)
    }
}

public struct ZhaohuParameter {
    public let from: String
    public let token: String
    public let requestUserInfoDelegate: RequestUserInfoDelegate
    
    public let env: String?
    public let version: String?
    
    public init (from: String, token: String, requestUserInfoDelegate: RequestUserInfoDelegate, env: String? = nil, version: String? = nil) {
        self.from = from
        self.token = token
        self.requestUserInfoDelegate = requestUserInfoDelegate
        self.env = env
        self.version = version
    }
}
