//
//  ViewController.swift
//  SwiftExploration-Sidatlu
//
//  Created by Yayat Nurhidayat on 19/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var smallLabel: UILabel!
    
    @IBOutlet weak var jempolButton: UIButton!
    
    @IBOutlet weak var telunjukButton: UIButton!
    
    @IBOutlet weak var kelingkingButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(state: .start)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func kelingkingButtonTap(_ sender: Any) {
        play(sign: .kelingking)
    }
    
    @IBAction func jempolButtonTap(_ sender: Any) {
        play(sign: .jempol)
    }
    
    
    @IBAction func telunjukButtonTap(_ sender: Any) {
        play(sign: .telunjuk)
    }
    
    
    
    @IBAction func playAgainTap(_ sender: Any) {
        updateUI(state: .start)
    }
    
    func updateUI(state: GameState) {
        switch state {
        case .start:
            smallLabel.text = state.startMessage
            view.backgroundColor = .white
            
            playAgainButton.isHidden = true
            
            kelingkingButton.isEnabled = true
            telunjukButton.isEnabled = true
            jempolButton.isEnabled = true
            kelingkingButton.isHidden = false
            telunjukButton.isHidden = false
            jempolButton.isHidden = false
            
            bigLabel.text = "🤖"
            
        case .win:
            smallLabel.text = state.winMessage
            view.backgroundColor = .green
            
        case .lose:
            smallLabel.text = state.loseMessage
            view.backgroundColor = .red
        case .draw:
            smallLabel.text = state.drawMessage
            view.backgroundColor = .yellow
            
        }
    }
    
    func play(sign: Sign) {
        let opponentSign: Sign = randomSign()
        updateUI(state: sign.compareTo(opponentSign: opponentSign))
        
        kelingkingButton.isEnabled = false
        telunjukButton.isEnabled = false
        jempolButton.isEnabled = false
        
        switch sign {
        case .jempol:
            telunjukButton.isHidden = true
            kelingkingButton.isHidden = true
        case .telunjuk:
            jempolButton.isHidden = true
            kelingkingButton.isHidden = true
        case .kelingking:
            jempolButton.isHidden = true
            telunjukButton.isHidden = true
        }
        
        bigLabel.text = opponentSign.emoji
        
        playAgainButton.isHidden = false
    }
}

