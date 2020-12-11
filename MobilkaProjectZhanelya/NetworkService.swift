//
//  NetworkService.swift
//  MobilkaProjectZhanelya
//
//  Created by Zhanelya Irmakhamed on 10/17/20.
//  Copyright © 2020 Zhanelya Irmakhamed. All rights reserved.
//

import Foundation
class NetworkService{
            func request(urlString: String, completion: @escaping (Result<SearchResponse, Error>)->Void){
                guard let url = URL(string: urlString) else{ return }
                     URLSession.shared.dataTask(with: url) { (data, response, error) in
                         DispatchQueue.main.async {
                             if let error = error{
                                 print("Some error")
                                completion(.failure(error))
                                return
                             }
                             guard let data = data else{ return }
                            do{
                                 let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                                completion(.success(tracks))
                                
                            } catch let jsonError {
                                print("Failed to decode JSONError", jsonError)
                                completion(.failure(jsonError))
                                
                            }
                           

                         }
                     }.resume()
                     
            }
}
