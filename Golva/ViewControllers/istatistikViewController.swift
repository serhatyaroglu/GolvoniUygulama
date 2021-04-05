//
//  istatistikViewController.swift
//  Golva
//
//  Created by Ertuğrul Kulaber on 9.02.2021.
//

import UIKit

class istatistikViewController: UIViewController, UICollectionViewDelegate {
   @IBOutlet weak var CollectionView: UICollectionView!
    
    var etkinlikListesi = [Modelleme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        let e1 = Modelleme(etkinlikAdi: "Zipline" , gun: "5", hafta: "15" , ay: "35" , resim: "zipline")
        let e2 = Modelleme(etkinlikAdi: "Rafting" , gun: "4", hafta: "13" , ay: "32" , resim: "rafting")
        let e3 = Modelleme(etkinlikAdi: "Safari" , gun: "3", hafta: "17" , ay: "23" , resim: "yaylasafari")
        let e4 = Modelleme(etkinlikAdi: "Atv" , gun: "6", hafta: "11" , ay: "34" , resim: "atvsafari")
        
        
        etkinlikListesi.append(e1)
        etkinlikListesi.append(e2)
        etkinlikListesi.append(e3)
        etkinlikListesi.append(e4)
       
        
    }

}
extension istatistikViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return etkinlikListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let etkinlik = etkinlikListesi[indexPath.row]
        
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "etkinlikBilgi" , for: indexPath) as! istatistikCollectionViewCell
        
        cell.ziplineLabel.text = etkinlik.etkinlikAdi!
        cell.ayLabel.text = etkinlik.ay!
        cell.gunLabel.text = etkinlik.gun!
        cell.haftaLabel.text = etkinlik.hafta
        cell.resimImage.image = UIImage(named:etkinlik.resim!)
       
        return cell
        
    }
    
    
}
