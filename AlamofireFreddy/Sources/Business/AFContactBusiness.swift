//
//  AFContactBusiness.swift
//  AlamofireSwiftyJson
//
//  Created by Luiz Duraes on 5/2/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation

internal struct AFContactBusiness {
    // MARK: - Properties
    var provider:AFContactReadable = AFContactProvider()
    
    // MARK: - Public
    func retrieveContacts(completion: AFContactItensClosure) {
        provider.retrieveContacts(completion)
    }
}