//
//  ContentView.swift
//  CSMStatusMenu
//
//  Created by Adam Overholtzer on 8/23/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextField("Title", text: .constant("Title"))
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
            
            ForEach(0..<6) { _ in
                Divider()
                RowView()
            }
        }
        .padding(.horizontal)
        .frame(width: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
