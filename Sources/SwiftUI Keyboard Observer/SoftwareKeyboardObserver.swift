//
//  File.swift
//  
//
//  Created by Chris Gaafary on 4/9/21.
//

import SwiftUI
import Combine

@propertyWrapper
public struct SoftwareKeyboardObserver {
    let keyboardSubject = CurrentValueSubject<SoftwareKeyboard?, Never>(nil)
    var cancellables = Set<AnyCancellable>()
    
    public var wrappedValue: SoftwareKeyboard? {
        keyboardSubject.value
    }
    
    public init() {
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillShowNotification)
            .map { _ in
                SoftwareKeyboard(status: .willShow)
            }
            .subscribe(keyboardSubject)
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardDidShowNotification)
            .map { _ in
                SoftwareKeyboard(status: .didShow)
            }
            .subscribe(keyboardSubject)
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in
                SoftwareKeyboard(status: .willHide)
            }
            .subscribe(keyboardSubject)
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UIApplication.keyboardDidHideNotification)
            .map { _ in
                SoftwareKeyboard(status: .didHide)
            }
            .subscribe(keyboardSubject)
            .store(in: &cancellables)
    }
}
