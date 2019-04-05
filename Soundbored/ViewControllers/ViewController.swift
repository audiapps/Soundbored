//
//  ViewController.swift
//  Soundbored
//
//  Created by Peter Bloxidge on 05/12/2018.
//  Copyright © 2018 Peter Bloxidge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var samplePadCollectionView: UICollectionView!
    
    private let sampleDescriptors = [
        SampleDescriptor(name: "Basic", path: "Samples/basic.wav", color: .red),
        SampleDescriptor(name: "Big Chris Who", path: "Samples/bigchriswho.wav", color: .orange),
        SampleDescriptor(name: "Big Dirty Who", path: "Samples/bigdirtywho.wav", color: .yellow),
        SampleDescriptor(name: "Big Scott Who", path: "Samples/bigscottwho.wav", color: .pink),
        SampleDescriptor(name: "Big Who", path: "Samples/bigwho.wav", color: .blue),
        SampleDescriptor(name: "Chris Who", path: "Samples/chriswho.wav", color: .purple),
        SampleDescriptor(name: "Chris Who 2", path: "Samples/chriswho2.wav", color: .green),
        SampleDescriptor(name: "Demented Who", path: "Samples/dementedwho.wav", color: .yellow),
        SampleDescriptor(name: "Long Laughing Who", path: "Samples/longlaughingwho.wav", color: .pink),
        SampleDescriptor(name: "Low Who", path: "Samples/lowwho.wav", color: .blue),
        SampleDescriptor(name: "Scott Who 2", path: "Samples/scottwho2.wav", color: .purple),
        SampleDescriptor(name: "Who", path: "Samples/who.wav", color: .green),
        SampleDescriptor(name: "Whooooo", path: "Samples/whooooo.wav", color: .green)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        samplePadCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleDescriptors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SamplePadCell", for: indexPath) as? SamplePadCell else {
            fatalError("Error: Unrecognised Reuse Indetifier")
        }
        cell.pad.descriptor = sampleDescriptors[indexPath.item]
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsPerRow: CGFloat = UIDevice.current.orientation.isPortrait ? 4 : 8
        let width = collectionView.bounds.width / cellsPerRow
        return CGSize(width: width, height: width)
    }
}
