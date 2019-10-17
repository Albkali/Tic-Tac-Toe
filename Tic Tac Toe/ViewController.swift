//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Aris👑 on 30/07/2019.
//  Copyright © 2019 Aris👑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @IBOutlet weak var label: UILabel!
    
    let winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    @IBAction func action(_ sender: AnyObject ) {
        
        if (gameState[sender.tag-1] == 0 ){
            gameState[ sender.tag-1 ] = activePlayer
            
        if ( activePlayer == 1) {
            sender.setImage( UIImage(named: "Cross.png"), for: UIControl.State())
            activePlayer = 2
        }
            
        else {
            
            sender.setImage( UIImage(named: "Noutgh.png"), for: UIControl.State())
            activePlayer = 1
        }
        }
        var won = false
        for combination in winningcombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    
                    label.text = " Cross has Won!"
                    won = true
                    
                }
                
                if gameState[combination[0]] == 2{
                    
                    label.text = " Nought has Won!"
                    won = true
                }
                
                PlayAgianButton.isHidden = false
                label.isHidden = false
                
            }
        }
        
        gameIsActive = false
        for i in gameState {
            if i == 0 {
            gameIsActive = true
            break
        }
        }
        if gameIsActive == false && won != true {
            label.text = " DRAW "
            label.isHidden = false
            PlayAgianButton.isHidden = false
        }
        
    }
    
    
    
    
    @IBOutlet weak var PlayAgianButton: UIButton!
    @IBAction func playagain(_ sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        PlayAgianButton.isHidden = true
        label.isHidden = true
        
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton; button.setImage(nil, for:UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

