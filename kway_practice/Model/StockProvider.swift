//
//  StockProvider.swift
//  kway_practice
//
//  Created by Eric chung on 2022/6/27.
//

import Foundation

class StockProvider {
    
    func getData(_ completion: @escaping (StockModel) -> Void) {
        let urlString = URL(string: "https://api.nstock.tw/v2/per-river/interview?stock_id=2330")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                let decoder = JSONDecoder()
                if let urlData = data {
                    do {
                        let searchResponse = try decoder.decode(StockModel.self, from: urlData)
                        DispatchQueue.main.async {
                            completion(searchResponse)
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("error")
                }
            }
            task.resume()
        }
    }
}
