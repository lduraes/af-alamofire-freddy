//
//  AFContactProvider.swift
//  AlamofireSwiftyJson
//
//  Created by Luiz Duraes on 5/2/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

internal struct AFContactProvider {
    // MARK: - Constants
    private let kRestUrl = "http://api.androidhive.info/contacts/"
}

// MARK: - AFContactReadable
extension AFContactProvider: AFContactReadable {
    func retrieveContacts(completion: AFContactItensClosure) {
        Alamofire.request(.GET, kRestUrl).responseJSON { response in
            do {
                let data: NSData = response.data!
                let json = try JSON(data: data)
                let contacts: [AFContact] = try json.array(AFContact.kContacts).map(AFContact.init)
                completion { contacts }
            } catch let error {
                completion { throw error }
            }
        }
    }
}