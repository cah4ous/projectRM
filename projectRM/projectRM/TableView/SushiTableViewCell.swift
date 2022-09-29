//
//  SushiTableViewCell.swift
//  projectRM
//
//  Created by Александр Троицкий on 28.09.2022.
//

import UIKit
/// Cоздание ячейки тейблвью для пиццы
class SushiTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: 10, y: 0, width: 100, height: 100)
        imageView?.contentMode = .scaleAspectFit
        
        textLabel?.frame = CGRect(x: 250, y: 40, width: self.frame.width - 45, height: 20)
    }
    
}
