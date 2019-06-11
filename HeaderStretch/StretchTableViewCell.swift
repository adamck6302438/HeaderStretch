//
//  StretchTableViewCell.swift
//  HeaderStretch
//
//  Created by Frances ZiyiFan on 6/11/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

import UIKit

class StretchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel : UILabel!
    @IBOutlet weak var headlineLabel : UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                categoryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ]
        )
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                headlineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                headlineLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
                headlineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                headlineLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
            ]
        )
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
