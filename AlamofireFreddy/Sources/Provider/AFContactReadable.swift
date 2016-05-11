//
//  AFContactReadable.swift
//  AlamofireFreddy
//
//  Created by Luiz Duraes on 5/9/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import Foundation

public typealias AFContactItensClosure = (() throws -> [AFContact]) -> Void

internal protocol AFContactReadable {
    /**
     Retrieves contacts
     
     - parameter completion: closure which retrieves an array of AFContact objects or throws an error
     */
    func retrieveContacts(completion: AFContactItensClosure)
}