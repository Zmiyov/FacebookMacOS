//
//  FacebookMacOSApp.swift
//  FacebookMacOS
//
//  Created by Vladimir Pisarenko on 11.05.2024.
//

import SwiftUI

@main
struct FacebookMacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding TextField Ring

extension NSTextField{
    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
