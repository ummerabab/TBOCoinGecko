//
//  CoinPriceEndPoint.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 10/06/2025.
//

import Foundation

enum CoinPriceEndPoint: Endpoint {
    case coinPrice(coin: String, params: CoinPriceParams)

    var path: String {
        switch self {
        case .coinPrice(let coin, _):
            return "/api/v3/coins/\(coin)/market_chart"
        }
    }

    var method: String {
        return "GET"
    }

    var parameters: [URLQueryItem]? {
        switch self {
        case .coinPrice(_, let params):
            return params.params
        }
    }
}
