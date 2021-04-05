//
//  GolvaApiService.swift
//  Golva
//
//  Created by serhat yaroglu on 2.04.2021.
//

import Foundation
import Alamofire

//func callTourApi(){
//    AF.request(URL(string: "http://golvoni.com/api/tours/guide")!,method: .get,parameters: nil, headers: nil).responseJSON { (response) in
//        if let responseData = response.data{
//            do {
//                let decodeJSON = JSONDecoder()
//                decodeJSON.keyDecodingStrategy = .convertFromSnakeCase
//                self.tourApiList = try decodeJSON.decode([tourModel].self, from: responseData)
//                self.tableView.reloadData()
//            }catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
