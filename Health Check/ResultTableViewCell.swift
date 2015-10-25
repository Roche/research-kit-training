//
//  ResultTableViewCell.swift
//  Health Check
//
//  Created by Michal Wojtysiak on 25/10/15.
//  Copyright © 2015 Michal Wojtysiak. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    var resultImage:UIImageView?
    
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        resultImage = UIImageView()
        contentView.addSubview(resultImage!)
    }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

    override func layoutSubviews() {
        super.layoutSubviews()
        resultImage?.frame = CGRectMake(frame.size.width - 50, 20, 30, 30)
    }
}
