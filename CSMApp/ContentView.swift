//
//  ContentView.swift
//  CatalystStatusMenu
//
//  Created by Adam Overholtzer on 8/23/21.
//

import SwiftUI

struct ContentView: View {
    
    #if targetEnvironment(macCatalyst)
    @StateObject var statusMenuHelper = StatusMenuHelper()
    #endif
    
    var body: some View {
        VStack {
            #if targetEnvironment(macCatalyst)
            Toggle("Enable Status Menu", isOn: $statusMenuHelper.isEnabled)
            #else
            Text("This is an iPhone/iPad.")
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
