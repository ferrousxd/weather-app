//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Чингиз Азимбаев on 20.02.2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var city: UILabel!
    
    static let identifier = String(describing: CityTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
