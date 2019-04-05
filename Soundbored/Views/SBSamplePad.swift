//
//  SBSamplePad.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 24/03/2019.
//  Copyright © 2019 Peter Bloxidge. All rights reserved.
//

import UIKit
import AudioKit

@IBDesignable
class SBSamplePad: UIView, NibBackedView {
    
    @IBOutlet var sampleButton: UIButton! {
        didSet {
            sampleButton.setBackgroundImage(#imageLiteral(resourceName: "Highlighted-Selected"), for: UIControl.State.highlighted.union(.selected))
        }
    }
    @IBOutlet var colorView: UIView! {
        didSet {
            colorView.layer.cornerRadius = 5
        }
    }
    @IBOutlet var sampleLabel: UILabel! {
        didSet {
            sampleLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            sampleLabel.layer.shadowOpacity = 0.7
            sampleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
            sampleLabel.layer.shadowRadius = 1
        }
    }
    
    private var audioFile: AKAudioFile? {
        didSet {
            if let sampleFile = audioFile {
                samplerDidFinishPlaying = debounce(interval: sampleFile.seconds, queue: DispatchQueue.main) { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.sampleButton.isSelected = false
                }
            }
        }
    }
    let sampler = AKAppleSampler()
    private var samplerDidFinishPlaying: () -> () = {}
    
    var descriptor: SampleDescriptor? {
        willSet {
            if let descriptor = newValue {
                do {
                    audioFile = try AKAudioFile(readFileName: descriptor.path)
                    try sampler.loadAudioFile(audioFile!)
                    sampleLabel?.text = descriptor.name
                    colorView.backgroundColor = descriptor.color.bgColor
                } catch {
                    print(error.localizedDescription)
                    sampleLabel?.text = "❓"
                    colorView.backgroundColor = Color.white.bgColor
                }
            }
        }
    }
    
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
        
        AudioEngine.instance.mixer.connect(input: sampler)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if audioFile != nil {
            try! sampler.play()
            sampleButton.isSelected = true
            samplerDidFinishPlaying()
        }
    }
}
