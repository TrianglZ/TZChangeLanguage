
# TZChangeLanguage

`TZChangeLanguage` is a Swift package that provides a SwiftUI view modifier that adds an alert dialog to prompt the user to change the app's language.

## Installation

You can install `TZChangeLanguage` using [Swift Package Manager (SPM)](https://swift.org/package-manager/):

1.  In Xcode, go to **File > Swift Packages > Add Package Dependency**.
2.  Enter the package repository URL: `https://bitbucket.org/trianglz/tzchangelanguage/src/master/`
3.  Follow the Xcode prompts to complete installation.

## Usage

To use `TZChangeLanguage` in your SwiftUI app, follow these steps:

1.  Import the package:
`import TZChangeLanguage` 

2.  In your SwiftUI view, add the `changeLanguageAlert` modifier to any view that should prompt the user to change the language:

```swift
import TZChangeLanguage

struct ContentView: View {
    @State private var showLanguageChangeAlert = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .changeLanguageAlert(isPresented: $showLanguageChangeAlert)
    }
}
```

## License

`TZChangeLanguage` is released under the [MIT License](https://opensource.org/license/mit/).