//
//  SamplePadCell.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 25/03/2019.
//  Copyright © 2019 Peter Bloxidge. All rights reserved.
//

import UIKit

@IBDesignable
class SamplePadCell: UICollectionViewCell, NibBackedView {
    
    @IBOutlet var pad: SBSamplePad!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        _init()
    }
    
    private func _init() {
        try! addNibViewAsSubview()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
