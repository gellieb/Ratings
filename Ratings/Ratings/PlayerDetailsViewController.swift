//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Angel Baek on 5/26/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    var player:Player!
    var game:String = "Chess"
    @IBAction func selectedGame(segue:UIStoryboardSegue){
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController, selectedGame = gamePickerViewController.selectedGame{
            detailLabel.text = selectedGame
            game = selectedGame
        }
    }
    
    //adding initializer and deinitializer
        // only see these when opening and closing Add Player screen. Reassure that VCs are loaded on-demand only.
    required init(coder aDecoder: NSCoder) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
        // deleted data source below this line. prevents static cells from working properly

    // user can tap anywhere in the first cell to activate text field
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: self.nameTextField.text, game: game, rating: 1)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
