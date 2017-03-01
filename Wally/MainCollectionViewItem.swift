//
//  MainCollectionViewItem.swift
//  Wally
//
//  Created by Wilbert Liu on 2/28/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Cocoa

class MainCollectionViewItem: NSCollectionViewItem {
    // MARK: IBOutlet

    @IBOutlet weak var wallpaperImageView: NSImageView!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
}
