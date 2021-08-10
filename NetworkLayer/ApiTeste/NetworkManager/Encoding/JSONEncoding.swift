//
//  JSONEncoding.swift
//  ApiTeste
//
//  Created by Igor de Castro on 05/08/21.
//

import Foundation

public struct JSONEncoding: ParameterEncoding {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        do {
            let data = try JSONSerialization.data(
                withJSONObject: parameters,
                options: .prettyPrinted
            )
            urlRequest.httpBody = data
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue(
                    "application/json",
                    forHTTPHeaderField: "Content-Type")
            }
            
        } catch  {
            throw NetworkError.encodingFailed
        }
    }
}
