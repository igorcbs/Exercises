//
//  HTTPTask.swift
//  ApiTeste
//
//  Created by Igor de Castro on 05/08/21.
//

import Foundation

public typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case request
    case requestParameters(
            bodyParameters: Parameters?,
            urlParameters: Parameters?
         )
    case requestParametersAndHeaders(
            bodyParameters: Parameters?,
            urlParameters: Parameters?,
            additionHeaders: HTTPHeaders?
         )
}
