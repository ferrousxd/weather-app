//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 18.02.2021.
//

import UIKit

class ChangeCityViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07058823529, green: 0.6862745098, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
