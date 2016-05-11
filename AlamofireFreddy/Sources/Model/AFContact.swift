//
//  AFContact.swift
//  AlamofireSwiftyJson
//
//  Created by Luiz Duraes on 5/2/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation
import Freddy

public struct AFContact {
    // MARK: - Constants
    static let kId = "id"
    static let kName = "name"
    static let kEmail = "email"
    static let kGender = "gender"
    static let kContacts = "contacts"
    
    // MARK: - Properties
    let id: String
    let name: String
    let email: String
    let gender: String
}

// MARK: - JSONDecodable
extension AFContact: JSONDecodable {
    public init(json value: JSON) throws {
        id = try value.string(AFContact.kId)
        name = try value.string(AFContact.kName)
        email = try value.string(AFContact.kEmail)
        gender = try value.string(AFContact.kGender)
    }
}