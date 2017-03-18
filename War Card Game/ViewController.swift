//
//  ViewController.swift
//  War Card Game
//
//  Created by Bryce Sulin on 3/18/17.
//  
//  Highest card wins the point until a winner reaches 10 points and then the game ends.
//
//  Copyright © 2017 BryceSulin. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightScoreLabel: UILabel!
    var rightScore = 0
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    var leftScore = 0
    
    let cardNames = ["card2", "card3", "card4", "card5", "card6", "card7", "card8",
                     "card9", "card10", "jack", "queen", "king", "ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dealTapped(_ sender: UIButton) {
        
        // Randomize left number from 0 to 12
        let leftNumber = Int(arc4random_uniform(13))
        
        // Randomize right number from 0 to 12
        let rightNumber = Int(arc4random_uniform(13))
        
        // Set the left image
        leftImageView.image = UIImage(named: cardNames[leftNumber])
        
        // Set the right image
        rightImageView.image = UIImage(named: cardNames[rightNumber])
        
        // Compare the card numbers
        if leftNumber > rightNumber {
            // Increment score
            leftScore += 1
            
            // Update label
            leftScoreLabel.text = String(leftScore)
        }
        else if leftNumber == rightNumber {
        }
        else {
            // Increment score
            rightScore += 1
            
            // Update label
            rightScoreLabel.text = String(rightScore)
        }
        
        // Decide the winner
        if leftScore == 10 {
            print("Left score wins!")
            exit(0)
        }
        else if rightScore == 10 {
            print("Right score wins!")
            exit(1)
        }
    }
}
