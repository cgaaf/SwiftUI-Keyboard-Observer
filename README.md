# SwiftUI Keyboard Observer

A description of this package.

```
{
import SwiftUI

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
}
```
