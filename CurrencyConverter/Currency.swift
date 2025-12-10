//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 10/12/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    
    //MARK: we can either keep id's type as Currency or Double since both currencys' and its values are unique
//    var id: Currency {
//        self
//    }
    var id: Double {
        rawValue
    }
    
    //computed properties
    var image: ImageResource {
        switch self {
        case .copperPenny:
                return .copperpenny
        case .silverPenny:
                return .silverpenny
        case .silverPiece:
                return .silverpiece
        case .goldPenny:
                return .goldpenny
        case .goldPiece:
                return .goldpiece
        }
    }
    
    var text: String {
        switch self {
        case .copperPenny:   return "Copper Penny"
        case .silverPenny:   return "Silver Penny"
        case .silverPiece:   return "Silver Piece"
        case .goldPenny:   return "Gold Penny"
        case .goldPiece:   return "Gold Piece"
        }
    }
}
