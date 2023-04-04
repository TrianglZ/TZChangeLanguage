//
//  ChangeLanguageAlert.swift
//  ExxonMobil
//
//  Created by Samir on 02/04/2023.
//

import SwiftUI

/**
 A SwiftUI view modifier that adds an alert dialog to prompt the user to change the app's language.

 Add the `changeLanguageAlert` modifier to any view that should prompt the user to change the language

 Example Usage:

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

*/
public struct ChangeLanguageAlertModifier: ViewModifier {

    /**
     Get the app name from the main bundle.
     */
    private var appName: String {
        let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
        return name ?? ""
    }

    /**
     Whether the alert dialog is currently presented.
     */
    @Binding var isPresented: Bool

    /**
     Adds the alert dialog to the modified view.

     - Parameter content: The view to modify.

     - Returns: The modified view.
     */
    public func body(content: Content) -> some View {
        return content.alert(Localization.title,
                             isPresented: $isPresented) {
            Button(Localization.cancelButton, role: .cancel, action: {
                isPresented = false
            })
            Button(Localization.settingsButton) {
                openSettings()
            }
        } message: {
            Text(String(format: Localization.message, appName))
        }
    }

    /**
     Opens the device settings app to allow the user to change the app's language.
     */
    private func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

/**
 Adds the `changeLanguageAlert` modifier to the `View` protocol, so that it can be used on any SwiftUI view.
 */
extension View {
    /**
     Adds an alert dialog to prompt the user to change the app's language.

     - Parameter isPresented: A binding to whether the alert dialog is currently presented.

     - Returns: The modified view.
     */
    public func changeLanguageAlert(isPresented: Binding<Bool>) -> some View {
        self.modifier(ChangeLanguageAlertModifier(isPresented: isPresented))
    }
}
