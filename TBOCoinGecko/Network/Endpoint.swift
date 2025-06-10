//
//  Endpoint.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 10/06/2025.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: String { get }
    var parameters: [URLQueryItem]? { get }
}
