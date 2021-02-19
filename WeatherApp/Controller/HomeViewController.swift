//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 18.02.2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func weatherAction(_ sender: Any) {
        let weatherViewController = storyboard?.instantiateViewController(identifier: "WeatherViewController") as! WeatherViewController
        navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
