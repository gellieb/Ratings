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
    
    // adding 2 unwind methods: cancel segue and save-when-done segue
        // create IBAction function then link to exit in order to create action segue and unwind segue
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue){
        if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController {
            
            //add the new player to the players array
            players.append(playerDetailsViewController.player)
            
            //update the tableView
            let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                // could've done tableView.reloadData() but it looks nicer to insert the new row with an animation
        }
    }
    
    
    
    
    // adding a Player array property
    // you can set up the (sample) data here in the VC but because this data may be provided from a plist or a SQL file, it's wise to handle loading the data outside of the VC
    var players: [Player] = playersData
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
// Iteration #1-----Subtitle cells. UITableViewCell.textLabel properties to access labels
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//      // UITableView.style = subtitle
//        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! UITableViewCell
//        let player = players[indexPath.row] as Player
//        cell.textLabel?.text = player.name
//        cell.detailTextLabel?.text = player.game
//        return cell
//        
       // method dequeueReusableCellWithIdentifier(_:forIndexPath:) will check to see if there is an existing cell that can be recycled.
       // if not, it will automatically allocate a prototype cell and return it to you.
       // remember to reuse the identifier that you set up on the prototype cell in the storyboard editor -- in this case PlayerCell
//    
//    }
    
// Iteration #2-----Customs cell, Using tags to id labels------------
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! UITableViewCell //1
//        
//        let player = players[indexPath.row] as Player //2
//        
//        if let nameLabel = cell.viewWithTag(100) as? UILabel { //3
//            nameLabel.text = player.name
//        }
//        if let gameLabel = cell.viewWithTag(101) as? UILabel {
//            gameLabel.text = player.game
//        }
//        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
//            ratingImageView.image = self.imageForRating(player.rating)
//        }
//        return cell
//
//        
       // BREAKDOWN:
       //  1. dequeueReusableCellWithIdentifier will dequeue an existing cell with the reuse identifier PlayerCell if available or create a new one if not.
       //  2. You look up the Player object corresponding to the row being populated and assign it to player.
       //  3. The labels and images are looked up by their tags on the cell (custom cell; cannot use UITableViewCell's textLabel and detailLabel's properties. MUST USE TAGS.
//        
//    }
//    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerCell
        
        let player = players[indexPath.row] as Player
        cell.nameLabel.text = player.name
        cell.gameLabel.text = player.game
        cell.ratingImageView.image = imageForRating(player.rating)
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

// 2. Note: In this app you’re using only one prototype cell but if your table needs to display different kinds of cells then you can simply add additional prototype cells to the storyboard. You can either duplicate the existing cell to make a new one, or increment the value of the Table View’s Prototype Cells attribute. Be sure to give each cell its own re-use identifier, though.

// 3. custom designed cells can no longer use UITableViewCell's textLabel and detailTextLabel properties to put text into the label. Only valid for standard cell types.
// Use tags instead to find the labels
