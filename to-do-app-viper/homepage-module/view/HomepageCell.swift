//
//  HomepageCell.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import UIKit

class HomepageCell: UITableViewCell {

    @IBOutlet var cellViewBackground: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
