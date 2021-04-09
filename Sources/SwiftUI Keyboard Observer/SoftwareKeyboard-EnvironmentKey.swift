//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//
import SwiftUI

private struct KeyboardIsVisible: EnvironmentKey {
    static let defaultValue: SoftwareKeyboard? = nil
}

extension EnvironmentValues {
    var softwareKeyboard: SoftwareKeyboard? {
        get { self[KeyboardIsVisible.self] }
        set { self[KeyboardIsVisible.self] = newValue }
    }
}
