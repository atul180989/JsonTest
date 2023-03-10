//
//  NetworkManager.swift
//  JsonDataExample
//
//  Created by Atul Bhaisare on 2/8/23.
//

import Foundation

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    private init() {}
    
    
    func fetchData(urlString: String, completion: @escaping(Result<[UserModel], Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let errorReceived = error {
                completion(.failure(errorReceived))
            } else {
                guard let receivedData = data else { return }
                do {
                    let receivedModel =  try JSONDecoder().decode([UserModel].self, from: receivedData)
                    completion(.success(receivedModel))
                }
                catch(let error) {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
