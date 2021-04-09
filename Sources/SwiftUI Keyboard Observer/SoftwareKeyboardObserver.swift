//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//

import SwiftUI
import Combine

class SoftwareKeyboardObserver: ObservableObject {
    @Published private(set) var softwareKeyboard: SoftwareKeyboard?
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillShowNotification)
            .sink { _ in
                print("Keyboard will show")
                self.softwareKeyboard = SoftwareKeyboard(status: .willShow)
            }
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardDidShowNotification)
            .sink { _ in
                print("Keyboard did show")
                self.softwareKeyboard = SoftwareKeyboard(status: .didShow)
            }
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillHideNotification)
            .sink { _ in
                print("Keyboard will hide")
                self.softwareKeyboard = SoftwareKeyboard(status: .willHide)
            }
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardDidHideNotification)
            .sink { _ in
                print("Keyboard did hide")
                self.softwareKeyboard = SoftwareKeyboard(status: .didHide)
            }
            .store(in: &cancellables)
    }
    
    func dismiss() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
