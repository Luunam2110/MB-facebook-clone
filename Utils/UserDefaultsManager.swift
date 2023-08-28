//
//  UserDefaultsManager.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let appSetting = "APP_SETTING_CONFIG"
    
    
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    
    // Lưu trữ một giá trị vào UserDefaults
    func saveSetting(_ value: ConfigDataModel) {
        userDefaults.set(value, forKey: appSetting)
    }
    
    // Truy xuất một giá trị từ UserDefaults
    func getSetting() -> ConfigDataModel {
        return userDefaults.value(forKey: appSetting) as? ConfigDataModel ?? ConfigDataModel()
    }
    
    // Xóa một giá trị từ UserDefaults
    func removeSetting() {
        userDefaults.removeObject(forKey: appSetting)
    }
}
