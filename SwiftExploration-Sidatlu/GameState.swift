//
//  GameState.swift
//  SwiftExploration-Sidatlu
//
//  Created by Yayat Nurhidayat on 19/01/24.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var startMessage: String {
        return "Mulai gamenya!"
    }
    var winMessage: String {
        return "Selamat, kamu menang!"
    }
    var loseMessage: String {
        return "Kamu kalah!"
    }
    var drawMessage: String {
        return "pertandingan draw!"
    }
}
