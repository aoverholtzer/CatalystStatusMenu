//
//  ContentView.swift
//  CatalystStatusMenu
//
//  Created by Adam Overholtzer on 8/23/21.
//

import SwiftUI

struct ContentView: View {
    
    #if targetEnvironment(macCatalyst)
    @StateObject var statusMenuController = StatusMenuController()
    #endif
    
    var body: some View {
        VStack {
            Text("Hello world!")
            
            #if targetEnvironment(macCatalyst)
            Toggle("Enable Status Menu", isOn: $statusMenuController.isEnabled)
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
