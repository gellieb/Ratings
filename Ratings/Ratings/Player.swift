//
//  Player.swift
//  Ratings
//
//  Created by Angel Baek on 5/18/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import Foundation
import UIKit

class Player: NSObject{
//    Player is container object for three properties: player's name, game they're playing, and a rating of 1 to 5 stars
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}

