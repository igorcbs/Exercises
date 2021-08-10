//
//  File.swift
//  ApiTeste
//
//  Created by Igor de Castro on 05/08/21.
//

import Foundation

protocol ParameterEncoding {
    static func encode(
        urlRequest: inout URLRequest,
        with parameters: Parameters) throws
}

struct Parameters{
    var parameters: [String: Any]
}
