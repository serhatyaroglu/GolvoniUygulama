//
//  ProfileViewController.swift
//  Golva
//
//  Created by serhat yaroglu on 2.04.2021.
//

import UIKit
import Alamofire
class ProfileViewController: UIViewController {
    @IBOutlet weak var UIView: UIView!
    @IBOutlet weak var PersonPhoto: UIImageView!
    @IBOutlet weak var PersonName: UILabel!
    @IBOutlet weak var JobOrCompany: UILabel!
    var ApiProfile = [tourModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        callTourApi()
        let  currentapi = ApiProfile
        PersonName.text = currentapi.
    }
    func callTourApi(){
        AF.request(URL(string: "http://golvoni.com/api/tours/guide")!,method: .get,parameters: nil, headers: nil).responseJSON { (response) in
            if let responseData = response.data{
                do {
                    let decodeJSON = JSONDecoder()
                    decodeJSON.keyDecodingStrategy = .convertFromSnakeCase
                    self.ApiProfile = try decodeJSON.decode([tourModel].self, from: responseData)
//                    self.UIView.reloadData()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
  

}
