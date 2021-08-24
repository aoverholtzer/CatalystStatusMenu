//
//  StatusMenuController.swift
//  CatalystStatusMenu
//
//  Created by Adam Overholtzer on 8/23/21.
//

import SwiftUI
import ServiceManagement

class StatusMenuController: ObservableObject {
    
    @AppStorage("com.overdesigned.CatalystStatusMenu.isEnabled")
    var isEnabled = false {
        didSet {
            if setStatusMenuEnabled(isEnabled) {
                // call to SMLoginItemSetEnabled worked
            } else {
                // call to SMLoginItemSetEnabled failed, so reset to FALSE
                isEnabled = false
            }
            objectWillChange.send()
        }
    }
    
    private func setStatusMenuEnabled(_ isEnabled: Bool) -> Bool {
        return SMLoginItemSetEnabled("com.overdesigned.CSMStatusMenu" as CFString, isEnabled)
    }
}
