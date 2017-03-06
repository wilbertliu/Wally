//
//  AppDelegate.swift
//  Wally
//
//  Created by Wilbert Liu on 2/28/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    // MARK: IBOutlet

    @IBOutlet weak var window: NSWindow!

    // MARK: Constant

    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
    let popover = NSPopover()

    // MARK: Variable

    var eventMonitor: EventMonitor?

    // MARK: App Delegate

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.title = "Wally"
        statusItem.highlightMode = true

        statusItem.button?.action = #selector(togglePopover(sender:))

        popover.contentViewController = MainViewController(
            nibName: MainViewController.className(),
            bundle: nil
        )

        eventMonitor = EventMonitor(mask: NSEventMask(rawValue: NSEventMask.leftMouseDown.rawValue | NSEventMask.rightMouseDown.rawValue)) { [unowned self] event in
            if self.popover.isShown {
                self.togglePopover(sender: event)
            }
        }

        eventMonitor?.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }

    // MARK: Action

    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            guard let statusItemButton = statusItem.button else {
                return
            }

            popover.show(
                relativeTo: statusItemButton.bounds,
                of: statusItemButton,
                preferredEdge: NSRectEdge.minY
            )
        }
    }
}

