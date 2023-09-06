//
//  LoginModel.swift
//  facebook
//
//  Created by Namlv on 28/08/2023.
//

import Foundation

struct UserModel: Encodable, Decodable {
    var email : String
    
    private enum CodingKeys: String, CodingKey {
        case email
    }
}

//class UserModel : NSObject, NSCoding {
//    required init?(coder: NSCoder) {
//        self.email = coder.decodeObject(forKey: "email") as? String ?? ""
//    }
//
//    var email : String
//
//    init(email: String) {
//        self.email = email
//    }
//
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(email, forKey: "email")
//    }
//}
