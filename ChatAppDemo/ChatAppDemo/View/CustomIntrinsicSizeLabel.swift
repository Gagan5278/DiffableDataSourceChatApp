//
//  CustomIntrinsicSizeLabel.swift
//  ChatAppDemo
//
//  Created by Gagan  Vishal on 7/21/20.
//

import UIKit

class CustomIntrinsicSizeLabel: UILabel {
    private let addedPaddingHeight: CGFloat = 10.0
    private let addedPaddingWidth: CGFloat = 15.0
    
    override var intrinsicContentSize: CGSize {
        let intrinsicSize = super.intrinsicContentSize
        //1. get height
        let height = intrinsicSize.height
        //2. set corner radius
        layer.cornerRadius = (height + addedPaddingHeight)/2.0
        layer.masksToBounds = true
        //3.return new size
        return .init(width: intrinsicSize.width + addedPaddingWidth, height: height + addedPaddingHeight)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
