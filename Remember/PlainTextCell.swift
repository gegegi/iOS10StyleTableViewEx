//
//  PlainTextCell.swift
//  Remember
//
//  Created by SeokHui Lee on 2016. 6. 18..
//  Copyright © 2016년 gegegi(tjzl1995@gmail.com). All rights reserved.
//

import UIKit

class PlainTextCell: UITableViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var titleView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var thumbImage: UIImageView!
    
    @IBOutlet var contentLabelHeight: NSLayoutConstraint!
    
    var line = 1
    
    var title: String? {
        get { return self.titleLabel.text }
        set(value) { self.titleLabel.text = value }
    }
    
    var content: String? {
        get { return self.contentLabel.text }
        set(value) {
            self.contentLabel.text = value
            
            let attributes = [NSFontAttributeName : self.contentLabel.font]
            let rect = self.contentLabel.text!.boundingRectWithSize(CGSizeMake(self.contentLabel.frame.size.width, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
            self.contentLabelHeight.constant = rect.height + 2
            
            self.line = Int(rect.height / (self.titleLabel.font.lineHeight + 2))
            print(self.line)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = titleView.bounds
        maskLayer.path = UIBezierPath(roundedRect: self.titleView.bounds, byRoundingCorners: UIRectCorner.TopRight.union(UIRectCorner.TopLeft), cornerRadii: CGSizeMake(13, 13)).CGPath
        titleView.layer.mask = maskLayer
        
        self.thumbImage.layer.cornerRadius = thumbImage.frame.width * 26 / 120
        self.cardView.layer.cornerRadius = 13
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
