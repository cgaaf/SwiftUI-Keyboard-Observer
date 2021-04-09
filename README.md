# SwiftUI Keyboard Observer

This package adds a view extension which adds an iOS software keyboard observer to the environment.

More documentation and updates to come. This is a very early draft. I appreciate any feedback or contributions!

```swift
import SwiftUI
import SwiftUI_Keyboard_Observer

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .observeSoftwareKeyboard()
        }
    }
}

struct ContentView: View {
    @State private var text: String = ""
    @Environment(\.softwareKeyboard) var softwareKeyboard
    
    var body: some View {
        VStack {
            Form {
                TextField("Text Field:", text: $text)
            }
            
            if softwareKeyboard?.isVisible == true {
                Button("Dismiss Keyboard") {
                    softwareKeyboard?.dismiss()
                }
                .padding()
            }
        }
    }
}
```
