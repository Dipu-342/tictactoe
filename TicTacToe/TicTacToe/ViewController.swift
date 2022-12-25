

import UIKit

class ViewController: UIViewController {

    enum turn{
        
        case Nought
        case Cross
    }
    
    
    
    
    @IBOutlet weak var turnlable: UILabel!
    
    

    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    var FirstTurn = turn.Cross
    var currentTurn = turn.Cross
    
    var NOUGHT = "O"
     var CROSS = "X"
    var Board = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
       
    }

    func initBoard() {
        Board.append(a1)
        Board.append(a2)
        Board.append(a3)
        Board.append(b1)
        Board.append(b2)
        Board.append(b3)
        Board.append(c1)
        Board.append(c2)
        Board.append(c3)

    }


    @IBAction func BoardTapAction(_ sender: UIButton) {

        addtoBoard(sender)
        if checkForVictory(CROSS)
        {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        
        if checkForVictory(NOUGHT)
        {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }

        if(fullBoard()){
            resultAlert(title: "Draw")
        }

    }
//
    

    
    
    func checkForVictory(_ s :String) -> Bool
    {
        // Horizontal Victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
        {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Vertical Victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
        {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
        {
            return true
        }
        
        return false
    }
    
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
        {
            return button.title(for: .normal) == symbol
        }
        
    
    func resultAlert(title: String)  {
        let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
                    self.resetBoard()
                }))
                self.present(ac, animated: true)
    }
    
    func resetBoard()
        {
            for button in Board
            {
                button.setTitle(nil, for: .normal)
                button.isEnabled = true
            }
            if FirstTurn == turn.Nought
            {
                FirstTurn = turn.Cross
                turnlable.text = CROSS
            }
            else if FirstTurn == turn.Cross
            {
                FirstTurn = turn.Nought
                turnlable.text = NOUGHT
            }
            currentTurn = FirstTurn
        }

    func fullBoard() -> Bool {
        for button in Board{
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }

    func addtoBoard(_ sender: UIButton){
        
        if(sender.title(for: .normal)==nil){
            
            if(currentTurn==turn.Nought){
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = turn.Cross
                turnlable.text = CROSS
                
            }else if(currentTurn==turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = turn.Nought
                turnlable.text = NOUGHT
                
            }
            sender.isEnabled = false
        }
    }
}

