//
//  Sign.swift
//  SwiftExploration-Sidatlu
//
//  Created by Yayat Nurhidayat on 19/01/24.
//

import Foundation

enum Sign {
    case jempol
    case telunjuk
    case kelingking
    
    var emoji: String {
        switch self {
        case .jempol:
            return "👍"
        case .telunjuk:
            return "☝️"
        case .kelingking:
            return "🤙"
        }
    }
    
    func compareTo(opponentSign : Sign) -> GameState {
        if self == .jempol {
            if opponentSign == .telunjuk {
                return .win
            } else if opponentSign == .kelingking {
                return .lose
            }
        }
        if self == .telunjuk {
            if opponentSign == .kelingking {
                return .win
            } else if opponentSign == .jempol {
                return .lose
            }
        }
        if self == .kelingking {
            if opponentSign == .jempol {
                return .win
            } else if opponentSign == .telunjuk {
                return .lose
            }
        }
        return .draw
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0 ... 2)
    if sign == 0 {
        return .jempol
    } else if sign == 1 {
        return .telunjuk
    } else {
        return .kelingking
    }
}
