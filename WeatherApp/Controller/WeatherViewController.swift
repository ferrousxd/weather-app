//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 18.02.2021.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    static var currentCity: String?

    let url = Constants.host
    var data: Model?
    
    private var decoder: JSONDecoder = JSONDecoder()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        fetchData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is how you remove extra empty cells in TableView
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WeatherTableViewCell.nib, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherCollectionViewCell.nib, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
    }
    
    func fetchData() {
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let responseData = response.data else {
                    return
                }
                guard let answer = try? self.decoder.decode(Model.self, from: responseData) else {
                    return
                }
                self.data = answer
                self.updateUI()
            case .failure(let err):
                print(err.errorDescription ?? "")
            }
        }
    }
    
    func updateUI() {
        cityName.text = data?.timezone
        temperature.text = "\(data?.current?.temp ?? 0.0)"
        feelsLike.text = "\(data?.current?.feels_like ?? 0.0)"
        desc.text = data?.current?.weather?.first?.description
        collectionView.reloadData()
        tableView.reloadData()
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.hourly?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as! WeatherCollectionViewCell
        let item = data?.hourly?[indexPath.item]
        
        cell.temperature.text = "\(item?.temp ?? 0.0)"
        cell.feelsLike.text = "\(item?.feels_like ?? 0.0)"
        cell.desc.text = item?.weather?.first?.description
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.daily?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        let item = data?.daily?[indexPath.row]
        
        cell.temperature.text = "\(item?.temp?.day ?? 0.0)"
        cell.feelsLike.text = "\(item?.feels_like?.day ?? 0.0)"
        cell.desc.text = item?.weather?.first?.description
        
        cell.tintColor = .white
        cell.accessoryType = .checkmark
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
