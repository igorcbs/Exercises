//
//  NetworkRouter.swift
//  ApiTeste
//
//  Created by Igor de Castro on 05/08/21.
//
import Foundation

protocol NetworkRouter: class {
    associatedtype EndPointType: EndpointType
    func request(
        _ route: EndPointType,
        completion: @escaping (_ data: Data?,
                               _ response: URLResponse?,
                               _ error: Error?) -> ()
    )
    func cancel()
}
