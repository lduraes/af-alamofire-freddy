//
//  AFGenericErrorType.swift
//  AlamofireSwiftyJson
//
//  Created by Luiz Duraes on 5/2/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit

enum AFGenericErrorType: ErrorType {
    case notFound
    case invalidUrl
    case unexpected
    case parse(String)
}
