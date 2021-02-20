//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 18.02.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    
    static let identifier = String(describing: WeatherTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
