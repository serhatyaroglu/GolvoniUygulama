//
//  istatistiketkinlik.swift
//  Golva
//
//  Created by Ertuğrul Kulaber on 9.02.2021.
//

import Foundation
class Modelleme {
    var etkinlikAdi:String?
    var gun:String?
    var hafta:String?
    var ay:String?
    var resim:String?
    
    init() {
    
    }
    init(etkinlikAdi:String,gun:String,hafta:String,ay:String,resim:String) {
        self.etkinlikAdi = etkinlikAdi
        self.gun = gun
        self.hafta = hafta
        self.ay = ay
        self.resim = resim
    }
}
