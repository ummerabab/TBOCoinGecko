//
//  CoinDataNetwork.swift
//  TBOCoinGecko
//
//  Created by Umme Rabab - on 08/06/2025.
//

import Foundation

class CoinDataNetwork {
    
    
    func fetchCoinPrice(endpoint: Endpoint, completion: @escaping(Result<[CoinPrice], EndpointError>) -> Void) {
        
        var components = URLComponents()
            components.scheme = "https"
            components.host = "api.coingecko.com"
            components.path = endpoint.path
            components.queryItems = endpoint.parameters

            guard let url = components.url else {
                completion(.failure(.invalidURL))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = endpoint.method
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse(description: "Request failed")))
                return
            }
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                let priceArray = json?["prices"] as? [[Any]]
                    
                var coinPrices: [CoinPrice] = []
                    
                priceArray?.forEach { object in
                    if object.count == 2 {
                        guard let marketCap = object[0] as? Double else {return}
                        guard let currentPrice = object[1] as? Double else {return}
                        let coinPrice = CoinPrice(currentPrice: currentPrice, marketCap: marketCap)
                        coinPrices.append(coinPrice)
                        print(coinPrices)
                    }
                }
                return completion(.success(coinPrices))
            }
            
            catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()

    }
    
}
