//
//  ConfigDataModel.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import Foundation

enum ThemeType {
    case light
    case dark
    case system
}


import Foundation

class ConfigDataModel {
    var localizationCode: String = "vi" // Default localization code
    var Theme: ThemeType = .system // Default system mode
}
