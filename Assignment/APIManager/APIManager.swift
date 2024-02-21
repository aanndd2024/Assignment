//
//  APIManager.swift
//  Assignment
//
//  Created by Anand Yadav on 20-02-2024.
//

import Foundation

typealias Handler<T> = (Result<T, DataError>) -> Void

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}


class APIManager {
    func getArticles<T: Decodable>() async throws ->  T {
        guard let url = URL(string: getURLString()) else {
            throw DataError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "get"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func getURLString() -> String {
        let urlPath = baseURL + apiMostPopularArticles + "?api-key=\(apiKey)"
        return urlPath
    }
}

//public func data(for request: URLRequest, delegate: (URLSessionTaskDelegate)? = nil) async throws -> (Data, URLResponse)
//
///// Convenience method to load data using a URL, creates and resumes a URLSessionDataTask internally.
/////
///// - Parameter url: The URL for which to load data.
///// - Parameter delegate: Task-specific delegate.
///// - Returns: Data and response.
//public func data(from url: URL, delegate: (URLSessionTaskDelegate)? = nil) async throws -> (Data, URLResponse)
