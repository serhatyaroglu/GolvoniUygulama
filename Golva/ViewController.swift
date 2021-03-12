//
//  ViewController.swift
//  Golva
//
//  Created by serhat yaroglu on 30.01.2021.
//

import UIKit
import Alamofire

extension UIImage {
       convenience init?(url: URL?) {
              guard let url = url else { return nil }
              do {
                     self.init(data: try Data(contentsOf: url))
              } catch {
                     print("Cannot load image from url: \(url) with error: \(error)")
                     return nil
              }
       }
}

class ViewController: UIViewController{
    @IBOutlet weak var ViewTab: UIView!
    @IBOutlet weak var SliderCollectionView: UICollectionView!
    
 
    @IBOutlet weak var tableView: UITableView!
    var Contacts = [Contact]()
    
    var apiResult : ApiResult? = nil
    var dataList : [Contact] = [Contact]()
    var originalArr = [Contact]();
  var sliderList = [Modelleme]()


   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        
        let e1 = Modelleme(etkinlikAdi: "Serhat Yaroglu" , gun: "Eveli Rafting", hafta: "Cuma" , ay: "Gun" , resim: "zipline")
       
        
        
        sliderList.append(e1)
        
        
        self.view.layoutMargins = UIEdgeInsets.zero
        getContacts()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        for contactsSearch in [Contacts] {
               Contacts.append(contentsOf: contactsSearch)
            
        }
       }
    
    func getContacts() {
           AF.request("https://api.mocki.io/v1/a684aed1")
                  .validate()
                  .responseDecodable(of: ApiResult.self) {
                         (response) in
                         guard let apiResultFromResponse = response.value else{return}
                         self.Contacts = apiResultFromResponse.response.contacts
                         
                    print(self.Contacts)
                    self.tableView.reloadData()
                         //print( self.apiResult!.metas.code )
                    print("sergat")
                  }
  
        
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let verticalPadding: CGFloat = 8
       let maskLayer = CALayer()
       maskLayer.cornerRadius = 12    //if you want round edges
       maskLayer.backgroundColor = UIColor.black.cgColor
       maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 1, dy: verticalPadding/6)
       cell.layer.mask = maskLayer
       let oldFrame = cell.contentView.frame
       cell.contentView.frame = CGRect(x: oldFrame.origin.x, y: oldFrame.origin.y, width: oldFrame.size.width + 5, height: oldFrame.size.height)
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Contacts.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! DetailsTableViewCell
    let currentContact = Contacts[indexPath.row]
    cell.turSaatiLabel?.text = currentContact.turSaati
    cell.turAdiLabel?.text = currentContact.turAdi
    cell.imageLabel?.image = UIImage(url: URL(string: currentContact.photo))
 

    return cell
}

func numberOfSections(in tableView: UITableView) -> Int {
       return 2
}
    
    
}

    
    
    
    
    

