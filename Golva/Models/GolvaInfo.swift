//
//  GolvaInfo.swift
//  Golva
//
//  Created by serhat yaroglu on 30.01.2021.
//

import Foundation
import Alamofire

struct ApiResult : Decodable {
    let metas:Meta
    let response:Response
}

struct Response :Decodable
{

    let contacts:[Contact]
}

struct Contact:Decodable {
    let photo:String
    let turAdi:String
    let turSaati:String
   // let kisiSayisi:String

    init(photo:String,turAdi:String,turSaati:String) {
        self.photo = photo
        self.turAdi = turAdi
        self.turSaati = turSaati
        //self.kisiSayisi = kisiSayisi
    }

}

struct Meta : Decodable {
    let code:Int
}

public func getStringText() -> String{
    return "\(Contact.self)"
  }

