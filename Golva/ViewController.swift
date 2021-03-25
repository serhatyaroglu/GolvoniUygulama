//
//  ViewController.swift
//  Golva
//
//  Created by serhat yaroglu on 30.01.2021.
//

import UIKit
import Alamofire
//
//extension UIImage {
//    convenience init?(url: URL?) {
//        guard let url = url else { return nil }
//        do {
//            self.init(data: try Data(contentsOf: url))
//        } catch {
//            print("Cannot load image from url: \(url) with error: \(error)")
//            return nil
//        }
//    }
//}
class ViewController: UIViewController{
    @IBOutlet weak var ViewTab: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var tourApiList = [tourModel]()
    var istatisticListApi = [mainEvent]()
    override func viewDidLoad() {
        super.viewDidLoad()
        callTourApi()
        callEventApi()
        self.view.layoutMargins = UIEdgeInsets.zero
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
       func callEventApi(){
           AF.request(URL(string: "http://golvoni.com/api/guide/statistic")!,method: .get,parameters: nil, headers: nil).responseJSON { (response) in
               if let responseData = response.data{
                   do {
                       let decodeJSON = JSONDecoder()
                       decodeJSON.keyDecodingStrategy = .convertFromSnakeCase
                    self.istatisticListApi = try decodeJSON.decode([mainEvent].self, from: responseData)
                       self.collectionView.reloadData()
                     
                   }catch{
                       print(error.localizedDescription)
                   }
               }
           }
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! EventCollectionViewCell
        let currentApiGolvaistatistic = istatisticListApi[indexPath.row]
        sliderCell.ayLbl.text = String(currentApiGolvaistatistic.monthCount!)
        sliderCell.dayLbl.text = String( currentApiGolvaistatistic.dayCount!)
        sliderCell.haftalbl.text = String(currentApiGolvaistatistic.weekCount!)
        sliderCell.istatistikDaylbl.text = String(currentApiGolvaistatistic.yearCount!)
        
        return sliderCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return istatisticListApi.count
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func callTourApi(){
        AF.request(URL(string: "http://golvoni.com/api/tours/guide")!,method: .get,parameters: nil, headers: nil).responseJSON { (response) in
            if let responseData = response.data{
                do {
                    let decodeJSON = JSONDecoder()
                    decodeJSON.keyDecodingStrategy = .convertFromSnakeCase
                    self.tourApiList = try decodeJSON.decode([tourModel].self, from: responseData)
                    self.tableView.reloadData()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 12    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 1, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
        let oldFrame = cell.contentView.frame
        cell.contentView.frame = CGRect(x: oldFrame.origin.x, y: oldFrame.origin.y, width: oldFrame.size.width + 2, height: oldFrame.size.height)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourApiList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! DetailsTableViewCell
        let currentGolvo = tourApiList[indexPath.row]
        cell.turAdiLabel.text = currentGolvo.name
        cell.turSaatiLabel.text = String("11:24")
        cell.parkurname.text = currentGolvo.parkourName
        cell.kisiSayisiLabel.text = String( currentGolvo.totalCustomerCount)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
