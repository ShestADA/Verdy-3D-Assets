//
//  AppDelegate.swift
//  Skyloon
//
//  Created by Vkwee on 18/05/25.
//

import Cocoa
import SceneKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the window and set its content view
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 1280, height: 720),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        
        window?.title = "Skyloon"
        window?.center()
        window?.makeKeyAndOrderFront(nil)
        
        // Create and set up the view controller
        let viewController = GameViewController()
        window?.contentViewController = viewController
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
