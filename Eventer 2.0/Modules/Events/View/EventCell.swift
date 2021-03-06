//
//  EventCell.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
    }
    
    func configure(title: String, data: String, startTime: String, endTime: String, roomNumbber: String){
        titleLabel.text = title
        dataLabel.text = data
        startTimeLabel.text = startTime
        roomLabel.text = roomNumbber
        endTimeLabel.text = endTime
    }
}
