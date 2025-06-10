//
//  CoinPrice.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 08/06/2025.
//

import Foundation

struct CoinPrice: Identifiable {
    var id: String = UUID().uuidString
    let currentPrice: Double
    let marketCap: Double
}
