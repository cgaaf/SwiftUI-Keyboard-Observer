//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//

import SwiftUI
import Combine

public struct SoftwareKeyboard {
    enum Status {
        case willShow, willHide, didShow, didHide
    }
    
    let status: Status
    
    var isVisible: Bool {
        switch status {
        case .willShow, .didShow:
            return true
        case .willHide, .didHide:
            return false
        }
    }
    
    func dismiss() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

