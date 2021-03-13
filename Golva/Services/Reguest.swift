//
//  Reguest.swift
//  Golva
//
//  Created by serhat yaroglu on 30.01.2021.
//

import Foundation
enum ContactError:Error {
    case noDataAvaible
    case canNotProcessData
}
struct Request {
    let resourceURL:URL
    let API_KEY = "a684aed1"
    init(contactCode:String) {
        let resourceString = "https://api.mocki.io/v1/\(API_KEY)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
        
    }
    
    func getContacts(completion: @escaping(Result<[Contact], ContactError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL){ data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvaible))
                return
            }
            do{
                let decoder = JSONDecoder()
                let apiResult = try decoder.decode(ApiResult.self, from: jsonData)
                //let successCode:Int = Int(200)
                if(apiResult.metas.code == 200)
                {
                    let contacts = apiResult.response.contacts
                    completion(.success(contacts))
                }
                else
                {
                    completion(.failure(.canNotProcessData))
                }
               
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        
        dataTask.resume()
    }
    
    
}

