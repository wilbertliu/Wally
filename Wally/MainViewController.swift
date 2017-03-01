//
//  MainViewController.swift
//  Wally
//
//  Created by Wilbert Liu on 2/28/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController, NSCollectionViewDataSource,  NSCollectionViewDelegateFlowLayout {
    // MARK: IBOutlet

    @IBOutlet weak var collectionView: NSCollectionView!
    @IBOutlet var settingsMenu: NSMenu!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.white.cgColor
    }

    // MARK: Collection View Data Source

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: "MainCollectionViewItem", for: indexPath)

        guard let mainItem = item as? MainCollectionViewItem else {
            return item
        }

        mainItem.wallpaperImageView.layer?.backgroundColor = NSColor.lightGray.cgColor

        return item
    }

    // MARK: Collection View Flow Layout Delegate

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let collectionViewBounds = collectionView.bounds
        return NSSize(width: (collectionViewBounds.width - 3) / 3, height: (collectionViewBounds.width - 3) / 3 / 1.5)
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.5
    }

    // MARK: Action

    @IBAction func settingsClicked(_ sender: NSButton) {
        settingsMenu.popUp(
            positioning: nil,
            at: sender.frame.origin,
            in: sender.superview
        )
    }

    @IBAction func startAtLoginClicked(_ sender: NSMenuItem) {
        sender.state = sender.state == 0 ? 1 : 0
    }
}
