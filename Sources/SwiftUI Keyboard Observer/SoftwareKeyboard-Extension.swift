//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//

import SwiftUI

struct SoftwareKeyboardContainer<Content: View>: View {
    @ViewBuilder var content: () -> Content
    @StateObject var softwareKeyboardObserver = SoftwareKeyboardObserver()
    
    var body: some View {
        content()
            .environment(\.softwareKeyboard, softwareKeyboardObserver.softwareKeyboard)
    }
}

public extension View {
    func observeSoftwareKeyboard() -> some View {
        SoftwareKeyboardContainer {
            self
        }
    }
}
