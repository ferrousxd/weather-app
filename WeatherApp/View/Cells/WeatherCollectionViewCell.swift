//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 18.02.2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    static let identifier = String(describing: WeatherCollectionViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
