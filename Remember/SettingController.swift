//
//  SettingController.swift
//  Remember
//
//  Created by SeokHui Lee on 2016. 6. 18..
//  Copyright © 2016년 gegegi(tjzl1995@gmail.com). All rights reserved.
//

import UIKit

class SettingController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var isOpen = false
    var tableView: UITableView?
    var xPosition: NSLayoutConstraint?
    
    var cells = Array<PlainTextCell>()
    
    init(withTableView tableView: UITableView, x: NSLayoutConstraint?) {
        
        self.tableView = tableView
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        self.tableView?.estimatedRowHeight = 44;
        
        if let xPos = x {
            self.xPosition = xPos
        }
    }
    
    var open: Bool {
        get {
            return isOpen
        }
        
        set(value) {
            if value != isOpen {
                self.isOpen = value
                
                if let xPos = xPosition {
                    if isOpen {
                        UIView.animateWithDuration(0.5, animations: {
                            xPos.constant -= (self.tableView?.bounds.width)!
                            self.tableView?.layoutIfNeeded()
                        })
                    } else {
                        UIView.animateWithDuration(0.5, animations: {
                            xPos.constant += (self.tableView?.bounds.width)!
                            self.tableView?.layoutIfNeeded()
                        })
                    }
                }
            }
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("CellForRow")
        
        let cell: PlainTextCell = tableView.dequeueReusableCellWithIdentifier("CELL_PLAIN_TEXT", forIndexPath: indexPath) as! PlainTextCell
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.title = "Title"
            cell.content = "Blah~ Blah~"
        case 1:
            cell.title = "제목"
            cell.content = "블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라"
        default:
            cell.title = "제목"
            cell.content = "블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라 블라"
        }
        self.cells.append(cell)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        print("HeightForRow")
        if self.cells.count > indexPath.row {
            let cell: PlainTextCell = self.cells[indexPath.row]
            return 44 + cell.contentLabelHeight.constant + 20
        }
        
        return 115
    }
}
