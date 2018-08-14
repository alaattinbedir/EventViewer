//
//  EventCell.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 14.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let eventNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let eventDateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func updateConstraints() {
        super.updateConstraints()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(eventNameLabel)
        addSubview(eventDateLabel)
    }
    
    func setupConstraints() {
        eventNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        eventDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eventNameLabel.snp.bottom).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
    }
}
