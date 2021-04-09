//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//
import SwiftUI

public struct KeyboardIsVisible: EnvironmentKey {
    public static let defaultValue: SoftwareKeyboard? = nil
}

public extension EnvironmentValues {
    var softwareKeyboard: SoftwareKeyboard? {
        get { self[KeyboardIsVisible.self] }
        set { self[KeyboardIsVisible.self] = newValue }
    }
}
