//
//  EventMonitor.swift
//  Wally
//
//  Created by Wilbert Liu on 3/1/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Cocoa

public class EventMonitor {
    // MARK: Constant

    private let mask: NSEventMask
    private let handler: ((NSEvent?) -> ())

    // MARK: Variable

    private var monitor: Any?

    // MARK: Object Life Cycle

    /// The constructor.
    ///
    /// - Parameters:
    ///   - mask: events that we want to monitor
    ///   - handler: what we need to do when one of the events occured
    public init(mask: NSEventMask, handler: @escaping ((NSEvent?) -> ())) {
        self.mask = mask
        self.handler = handler
    }

    deinit {
        stop()
    }

    // MARK: Public Method

    /// Start monitoring events according to the *mask* and *handler* variable.
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }

    /// Stop monitoring events.
    /// It would also be called by *deinit* to make sure the monitor is completely removed
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }

}
