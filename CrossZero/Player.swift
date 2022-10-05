//
//  Player.swift
//  CrossZero
//
//  Created by Вадим Лавор on 5.10.22.
//

import Foundation

enum Player {
    
    case cross(playerInput: [Int])
    case zero(playerInput: [Int])

    func isWinner() -> Bool {
        let paths: [Int:[Int]] = [1:[0,3,],2:[2],3:[0,1,2],4:[0]]
        var input: [Int] = []
        var isWinner = false
        
        switch self {
        case .zero(let playerInput):
            input = playerInput
        case .cross(let playerInput):
            input = playerInput
        }
      
        input.forEach {
            for index in 1...4 {
                if input.contains($0 + index), input.contains($0 + (index * 2)), (paths[index]?.contains(input.sorted().first!))! {
                    isWinner = true
                }
            }
        }
        return isWinner
    }
    
}
