//
//  EndpointError.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 10/06/2025.
//

import Foundation

enum EndpointError: Error {
    case invalidURL
    case invalidData
    case invalidResponse(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidData: return "Invalid Data"
        case let .invalidResponse(description): return "Request failed \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code \(statusCode)"
        case let .unknownError(error): return "An unknown error occured \(error.localizedDescription)"
        }
    }
}
