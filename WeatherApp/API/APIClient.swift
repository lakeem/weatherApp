//
//  APIClient.swift
//  WeatherApp
//
//  Created by lakeem muhammad on 1/20/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import Foundation


protocol APIClient {
    var session: URLSession {get}
    func fetch<V: Codable> (with
        Request: URLRequest, completion : @escaping (Either<V, APIError >)->  Void )
    
}

enum Either<V, E : Error>{
    case value(V)
    case error (E)
}

enum APIError: Error {
    case apiError
    case badResponse
    case decodeError
    case unknown(String)
}

extension APIClient  {
    func fetch<V: Codable> (with Request: URLRequest, completion : @escaping (Either<V, APIError >)->  Void ){
        let task = session.dataTask(with: Request) { (data, response, error) in
            guard error == nil else{
                completion(.error(.apiError) )
                return
            }
            guard let response =  response as? HTTPURLResponse , 200..<300 ~= response.statusCode else {
                completion(.error(.badResponse ))
                return
            }
            
            guard let value = try?  JSONDecoder().decode(V.self, from: data!) else {
                completion(.error(.decodeError))
                return
            }
            completion(.value(value))
        }
        task.resume()
    }
}
