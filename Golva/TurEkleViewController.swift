//
//  TurEkleViewController.swift
//  Golva
//
//  Created by serhat yaroglu on 9.02.2021.
//

import UIKit

class TurEkleViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    var TurEkleListe = [TurEkle]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.CollectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.6)
        
        CollectionView!.collectionViewLayout = tasarim
        CollectionView.dataSource = self
        CollectionView.delegate = self
        let Zipline = TurEkle(butonEtkinlikAdi: "zipline")
        let Rafting = TurEkle(butonEtkinlikAdi: "rafting")
        let  Atv = TurEkle(butonEtkinlikAdi: "atv")
        let Safari = TurEkle(butonEtkinlikAdi: "safari")
        TurEkleListe.append(Zipline)
        TurEkleListe.append(Rafting)
        TurEkleListe.append(Atv)
        TurEkleListe.append(Safari)

    }
  
    



}
extension TurEkleViewController:UICollectionViewDataSource,UICollectionViewDelegate,TurEkleHucreProtocol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TurEkleListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tur = TurEkleListe[indexPath.row]
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "TurEkleCell", for: indexPath) as! TurEkleCollectionViewCell
        cell.TurEkleButon.text = tur.butonEtkinlikAdi
        return cell
    }
    
    func SayfaGecis(indexPath: IndexPath) {
        let Tur = TurEkleListe[indexPath.row]
        print("\(Tur.butonEtkinlikAdi!) ")
    }
    
}
