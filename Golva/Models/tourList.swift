//
//  tourList.swift
//  Golva
//
//  Created by serhat yaroglu on 12.03.2021.
//

import Foundation
class tourModel : Codable  {
    var name : String?
    var parkourName : String?
    var fee : Int
    var totalCustomerCount : Int
 //   var startDate : Int
}
class mainEvent: Codable {
    var weekCount : Int?
    var yearCount : Int?

}
