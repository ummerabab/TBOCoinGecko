//
//  CoinPriceParams.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 10/06/2025.
//

import Foundation

struct CoinPriceParams {
    
    let currency: String
    let days: String
    let interval: String
    let precision: String
    
    var params: [URLQueryItem] {
        [
          URLQueryItem(name: "vs_currency", value: currency),
          URLQueryItem(name: "days", value: days),
          URLQueryItem(name: "interval", value: interval),
          URLQueryItem(name: "precision", value: precision)
        ]
    }
}
