//
//  TurEkleCollectionViewCell.swift
//  Golva
//
//  Created by serhat yaroglu on 9.02.2021.
//

import UIKit
protocol TurEkleHucreProtocol {
    func SayfaGecis(indexPath:IndexPath)
}

class TurEkleCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var TurEkleButon: UILabel!
    var hucreProtocol:TurEkleHucreProtocol?
    var indexPath:IndexPath?
}
