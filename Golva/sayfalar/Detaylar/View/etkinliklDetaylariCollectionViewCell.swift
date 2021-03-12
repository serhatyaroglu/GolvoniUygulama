//
//  etkinliklDetaylariCollectionViewCell.swift
//  Golva
//
//  Created by Ertuğrul Kulaber on 14.02.2021.
//

import UIKit

    @IBDesignable class etkinlikDetaylarıView : temelView {
    
    @IBOutlet weak var colectionView : UICollectionView!
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var lblgün : UILabel!
    @IBOutlet weak var lblhafta : UILabel!
    @IBOutlet weak var lblay : UILabel!
    @IBOutlet weak var lblday : UILabel!
    @IBOutlet weak var lblrehberAd : UILabel!
    @IBOutlet weak var lbltesisAd : UILabel!
    
    
        @IBAction func handleControl( sender : UIPageControl ){
            
        }
   
    
    
}
//   class etkinliklDetaylariCollectionViewCell: UICollectionViewCell {
   
//   let img1st = UIImageView()
 //  let imgkupa = UIImageView()
 //  let lblgün = String()
  // let lblhafta = String()
  // let lblay = String()
  // let lblday = String()
  // let lblrehberAd = String()
  // let lbltesisAdı = String()
   
