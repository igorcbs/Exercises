//
//  Router.swift
//  ApiTeste
//
//  Created by Igor de Castro on 05/08/21.
//

import Foundation

class Router<EndPointType: EndpointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func request(_ route: EndPointType, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let session = URLSession.shared
        
        do {
            let request = try self.buildRequest(from: route)
            task  = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data,response,error)
            })
            
        } catch  {
            completion(nil, nil, error)
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndPointType) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            case .requestParameters(
                    let bodyParameters,
                    let urlParameters
            ):
                
                try self.configureParameters(
                    bodyParameter: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request
                )
            
            case .requestParametersAndHeaders(
                    let bodyParameters,
                    let urlParameters,
                    let additionalHeaders
            ):
                
                self.addAdditionalHeaders(
                    additionalHeaders,
                    request: &request)
                
                try self.configureParameters(
                    bodyParameter: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request
                )
            }
            
            return request
        } catch  {
            throw error
        }
        
    }
    
    fileprivate func configureParameters(
        bodyParameter: Parameters?,
        urlParameters: Parameters?,
        request: inout URLRequest
    ) throws {
        
        do {
            if let body = bodyParameter {
                try JSONEncoding.encode(urlRequest: &request, with: body)
            }
            
            if let url = urlParameters {
                try URLEncoding.encode(urlRequest: &request, with: url)
            }
        } catch  {
            throw error
        }
    }
    
    private func addAdditionalHeaders(
        _ headers: HTTPHeaders?,
        request: inout URLRequest
    ) {
        
        guard let headers = headers else {
            return
        }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }

}
