//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Angel Baek on 5/16/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

//import Cocoa
import UIKit

class PlayersViewController: UITableViewController {
    
    // adding a Player array property
    // you can set up the (sample) data here in the VC but because this data may be provided from a plist or a SQL file, it's wise to handle loading the data outside of the VC
    var players: [Player] = playersData
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection sectoin: Int) -> Int {
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! UITableViewCell
        let player = players[indexPath.row] as Player
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.game
        return cell
        
    }
    
    func imageForRating(rating:Int) -> UIImage? {
        // returns a different star image depending on the rating.
        switch rating {
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
    }

}

// NOTES:
// 1. method dequeueReusableCellWithIdentifier(_:forIndexPath:) will check to see if there is an existing cell that can be recycled.
// if not, it will automatically allocate a prototype cell and return it to you.
// remember to reuse the identifier that you set up on the prototype cell in the storyboard editor -- in this case PlayerCell

// 2. Note: In this app you’re using only one prototype cell but if your table needs to display different kinds of cells then you can simply add additional prototype cells to the storyboard. You can either duplicate the existing cell to make a new one, or increment the value of the Table View’s Prototype Cells attribute. Be sure to give each cell its own re-use identifier, though.

// 3. custom designed cells can no longer use UITableViewCell's textLabel and detailTextLabel properties to put text into the label. Only valid for standard cell types.
// Use tags instead to find the labels
