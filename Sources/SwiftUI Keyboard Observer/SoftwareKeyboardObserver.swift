//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//

import SwiftUI
import Combine

public class SoftwareKeyboardObserver: ObservableObject {
    @Published private(set) var softwareKeyboard: SoftwareKeyboard?
    
    public init() {
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillShowNotification)
            .map { _ in SoftwareKeyboard(status: .willShow) }
            .assign(to: &$softwareKeyboard)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardDidShowNotification)
            .map { _ in SoftwareKeyboard(status: .didShow) }
            .assign(to: &$softwareKeyboard)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in SoftwareKeyboard(status: .willHide) }
            .assign(to: &$softwareKeyboard)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardDidHideNotification)
            .map { _ in SoftwareKeyboard(status: .didHide) }
            .assign(to: &$softwareKeyboard)
    }
}
