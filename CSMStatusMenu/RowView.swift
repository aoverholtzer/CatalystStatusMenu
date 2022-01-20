//
//  RowView.swift
//  CSMStatusMenu
//
//  Created by Adam Overholtzer on 1/20/22.
//

import SwiftUI

struct RowView: View {
    @State private var isFocused = false
    
    var body: some View {
        Text("Sample text")
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                FocusableView {
                    isFocused = $0
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(isFocused ? Color.accentColor : Color.clear)
                    .padding(.horizontal, -8)
                    .padding(.vertical, 2)
            )
    }
}

struct FocusableView: NSViewRepresentable {
    var onFocus: (Bool)->Void
    
    func makeNSView(context: Context) -> FocusableNSView {
        return FocusableNSView(onFocus: onFocus)
    }
    
    func updateNSView(_ nsView: FocusableNSView, context: Context) {
        // nothing
    }
    
    class FocusableNSView: NSView, NSMenuDelegate {
        
        var onFocus: (Bool)->Void
        
        internal init(onFocus: @escaping (Bool) -> Void) {
            self.onFocus = onFocus
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func draw(_ dirtyRect: NSRect) {
            // draw nothing
        }
                
        override var acceptsFirstResponder: Bool {
            return true
        }
        
        override var canBecomeKeyView: Bool {
            return true
        }
        
        override func becomeFirstResponder() -> Bool {
            if super.becomeFirstResponder() {
                onFocus(true)
                return true
            } else {
                return false
            }
        }
        
        override func resignFirstResponder() -> Bool {
            if super.resignFirstResponder() {
                onFocus(false)
                return true
            } else {
                return false
            }
        }
    } // end FocusableNSView
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
            .frame(width: 300)
            .previewLayout(.sizeThatFits)
    }
}
