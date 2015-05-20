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
        // method dequeueReusableCellWithIdentifier(_:forIndexPath:) will check to see if there is an existing cell that can be recycled.
        // if not, it will automatically allocate a prototype cell and return it to you.
        // remember to reuse the identifier that you set up on the prototype cell in the storyboard editor -- in this case PlayerCell
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! UITableViewCell
        let player = players[indexPath.row] as Player
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.game
        return cell
    }

}
