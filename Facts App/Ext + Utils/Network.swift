//
//  Network.swift
//  Facts App
//
//  Created by Abdallah Mahameed on 06/01/2024.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

struct APIData {
    
    let header = [
        "X-RapidAPI-Key": "70beeac263msh003a1604b2e0bc6p1fd282jsn0fd6a88a7845",
        "X-RapidAPI-Host": "numbersapi.p.rapidapi.com"
    ]
    
    let baseURL = "https://numbersapi.p.rapidapi.com/"
    
}

final class Network {
    
    func fetchData<T: Codable>(for: T.Type, url: String) -> AnyPublisher<T, NetworkError>{
        
        let apiData = APIData()
        
        guard let url = URL(string: apiData.baseURL + url) else{
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
        
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = apiData.header
        
        return URLSession
            .shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap{ data, response in
                guard let response  = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw NetworkError.networkError(NSError(domain: "Fetching Data Failed", code: 500))
                }
                
                return data
            }
            .mapError { error in NetworkError.networkError(error)}
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in NetworkError.decodingError(error)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
