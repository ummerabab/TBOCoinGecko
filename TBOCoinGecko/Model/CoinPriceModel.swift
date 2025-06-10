//
//  CoinPriceModel.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 08/06/2025.
//

import Foundation

class CoinPriceModel: ObservableObject {
    
    @Published var coinPriceArray = [CoinPrice]()
    @Published var errorMessage: String?
    
    private let network = CoinDataNetwork()
    
    init() {
        
        setupURL()
    }
    
    func setupURL() {
        let coinName = "bitcoin"

        let query = CoinPriceParams (
            currency: "eur",
            days: "14",
            interval: "daily",
            precision: "2"
        )

        let coinPriceURL = CoinPriceEndPoint.coinPrice(coin: coinName, params: query)
        fetchPrice(endpoint: coinPriceURL)
    }
    
    func fetchPrice(endpoint: Endpoint) {
        network.fetchCoinPrice(endpoint: endpoint, completion: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let prices): self?.coinPriceArray = prices
                case .failure(let error): self?.errorMessage = error.localizedDescription
                }
            }
        })
    }
}
