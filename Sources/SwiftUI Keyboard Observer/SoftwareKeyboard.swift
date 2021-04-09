//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//

import SwiftUI
import Combine

public struct SoftwareKeyboard {
    public enum Status {
        case willShow, willHide, didShow, didHide
    }
    
    public let status: Status
    
    public var isVisible: Bool {
        switch status {
        case .willShow, .didShow:
            return true
        case .willHide, .didHide:
            return false
        }
    }
    
    public func dismiss() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

