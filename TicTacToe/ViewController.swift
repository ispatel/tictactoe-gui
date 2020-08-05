//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ishan Patel on 7/31/20.
//  Copyright © 2020 Ishan Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Connecting Buttons + labels
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var btn6: UIButton!
    
    @IBOutlet weak var btn7: UIButton!
    
    @IBOutlet weak var btn8: UIButton!
    
    @IBOutlet weak var btn9: UIButton!
    
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var Restart: UIButton!
    
    @IBOutlet weak var lblPlayerScore: UILabel!
    
    @IBOutlet weak var lblCpuScore: UILabel!
    
    
    var activePlayer = Int.random(in: 0...1)//picks random player to start game
    var gameBoard = [2,2,2,2,2,2,2,2,2]
    //cross = 0
    //nought = 1
    //empty space = 2
    var playerScore:Int = 0 //variable to keep track of player score
    var cpuScore:Int = 0//variable to keep track of cpu score
    
    
    func checkWin(board: [Int], activePlayer: Int) -> Bool{
        //function checks if player has won
        
        func runWin(board: [Int], activePlayer: Int){//executes  commands if win detected
            gameBoard = [0,0,0,0,0,0,0,0,0]//players cant make another move
            if activePlayer == 1{
                print("player 1 wins")//print debugger
                lblText.text = "Player 1 Wins!"//print in ui
                playerScore += 1 // adds one to player score count
                lblPlayerScore.text = String(playerScore) //updates label with score count
            }
            else{
                print("CPU wins")//print in debugger
                lblText.text = "CPU Wins!"//print in ui
                cpuScore += 1 //adds one to cpu score count
                lblCpuScore.text = String(cpuScore)//updates label with score count
            }
            
        }
        for i in 0...2{ //checks for vertical win
            if board[i] == board[i+3] && board[i] == board[i+6] && board[i] != 2 {
                runWin(board: board, activePlayer: activePlayer)
                return true
            }
        }
        
        for i in 0...7{//checks for horizontal win
            if i == 0 || i == 3 || i == 6{
                if board[i] == board[i+1] && board[i+1] == board[i+2] && board[i] != 2{
                    runWin(board: board, activePlayer: activePlayer)
                    return true
                }
            }
        }
        
        if board[0] == board[4] && board[4] == board[8] && board[0] != 2{//checks for diagonal win
            runWin(board: board, activePlayer: activePlayer)
            return true
        }
        if board[2] == board[4] && board[4] == board[6] && board[2] != 2{//checks for diagonal win
            runWin(board: board, activePlayer: activePlayer)
            return true
        }
        return false
    }
    
    func fullBoard(board: [Int], Win: Bool) {
        func blankspace(board: [Int]) -> Bool{
            for i in 0...8{
                if board[i]==2{
                    return true
                }
            }
            return false
        }
        
        if Win == false && blankspace(board: board) == false{
            print("It's a draw")
            lblText.text = "It's a draw!"
            gameBoard = [0,0,0,0,0,0,0,0,0]
            
        }
        
        
    }
    @IBAction func btnTap(_ sender: AnyObject) {
        if gameBoard[sender.tag-1] == 2{
           
            if activePlayer == 0 {
                sender.setImage(UIImage(named: "Cross.png"), for: .normal)
                activePlayer = 1
                gameBoard[sender.tag-1] = 0
                print(gameBoard)
                //checks if move caused player 1 to win
                if checkWin(board: gameBoard, activePlayer: activePlayer) == false{
                    //run full board
                }
            }
            else{
                sender.setImage(UIImage(named: "Nought.png"), for:
                    .normal)
                activePlayer = 0
                gameBoard[sender.tag-1] = 1
                print(gameBoard)
                //checks if move caused cpu to win
                if checkWin(board: gameBoard, activePlayer: activePlayer) == false{
                    //run full board
                }
            }
        }
        else{
             lblText.text = "pick a space that has not been taken"
        }
    }


    @IBAction func Restart(_ sender: Any) {
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
            gameBoard = [2,2,2,2,2,2,2,2,2]
        }
    }
    
}

