//
//  StatusMenuHelper.swift
//  CatalystStatusMenu
//
//  Created by Adam Overholtzer on 8/23/21.
//

import SwiftUI
import ServiceManagement

class StatusMenuHelper: ObservableObject {
    
    @AppStorage("com.overdesigned.CatalystStatusMenu.isEnabled")
    var isEnabled = false {
        didSet {
            if setStatusMenuEnabled(isEnabled) {
                // success!
            } else {
                // SMLoginItemSetEnabled failed
                isEnabled = false
            }
            objectWillChange.send()
        }
    }
    
    private func setStatusMenuEnabled(_ isEnabled: Bool) -> Bool {
        let bundleId = "com.overdesigned.CSMStatusMenu" as CFString
        return SMLoginItemSetEnabled(bundleId, isEnabled)
    }
}
