//
//  ZhaohuFloatingButton.swift
//  zhaohu-sdk-ios
//
//  Created by 明扬 on 2019/8/28.
//

import UIKit
import MaterialComponents.MaterialButtons

@IBDesignable open class ZhaohuFloatingButton: MDCFloatingButton {
    public override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
        self.setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    let plusImage = #imageLiteral(resourceName: "mesoor-round-logo.png")

    private func setup() {
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(plusImage, for: .normal)
        self.accessibilityLabel = "Create"
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
