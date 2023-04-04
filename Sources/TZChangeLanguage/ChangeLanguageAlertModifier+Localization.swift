//
//  ChangeLanguageAlertModifier+Localization.swift
//  ExxonMobil
//
//  Created by Samir on 02/04/2023.
//

import Foundation

extension ChangeLanguageAlertModifier {
    enum Localization {
        static let title = getLocalized(key: "alert_title")
        static let message = getLocalized(key: "alert_message")
        static let cancelButton = getLocalized(key: "alert_cancel_button")
        static let settingsButton = getLocalized(key: "alert_go_to_settings_button")
    }
}

extension ChangeLanguageAlertModifier.Localization {
    static func getLocalized(key: String) -> String {
        String(localized: String.LocalizationValue(key), table: "ChangeLanguageAlert", bundle: .module)
    }
}
