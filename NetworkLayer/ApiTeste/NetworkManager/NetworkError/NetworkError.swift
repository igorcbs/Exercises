//
//  NetworkError.swift
//  ApiTeste
//
//  Created by Igor de Castro on 05/08/21.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters are nil"
    case encodingFailed = "Parameters encoding Failed"
    case missingURL = "URL is nil"
}
