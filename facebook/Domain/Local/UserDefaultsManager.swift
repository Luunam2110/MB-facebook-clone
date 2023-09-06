//
//  UserDefaultsManager.swift
//  facebook
//
//  Created by Namlv on 06/08/2023.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userKey = "USER"
    
    
    private let userDefaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func saveUser(_ user : UserModel) {
        do {
            let data = try encoder.encode(user)
            userDefaults.set(data, forKey: userKey)
        } catch {
            print("Unable to Encode User (\(error))")
        }
        
    }
    
    func getUser() -> UserModel? {
        if let data = UserDefaults.standard.data(forKey: userKey) {
            do {
                let user = try decoder.decode(UserModel.self, from: data)
                return user;
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        // Retrieve the encoded data from UserDefaults
        return nil
    }
    
    func removeUser() {
        userDefaults.removeObject(forKey: userKey)
    }
}
