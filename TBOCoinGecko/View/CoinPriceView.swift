//
//  CoinPriceView.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 08/06/2025.
//

import SwiftUI

struct CoinPriceView: View {
    
    @StateObject var coinPrice = CoinPriceModel()
    
    var body: some View {
        VStack{
            Text("Prices for \(Date.now, format: .dateTime.day().month().year())")
            List {
                ForEach(coinPrice.coinPriceArray) { coin in
                    let value = String(format: "%.2f", coin.currentPrice)
                    Text("Current Price of  : \(value) EUR")
                }
                
            }
        }.onAppear {
            coinPrice.setupURL()
        }
    }
}

#Preview {
    CoinPriceView()
}
