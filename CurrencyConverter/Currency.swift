//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 10/12/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable, RawRepresentable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    case platinumPenny = 0.25
    
    
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
        case .platinumPenny:
            return .platinumpenny
        }
    }
    
    var text: String {
        switch self {
        case .copperPenny:   return "Copper Penny"
        case .silverPenny:   return "Silver Penny"
        case .silverPiece:   return "Silver Piece"
        case .goldPenny:   return "Gold Penny"
        case .goldPiece:   return "Gold Piece"
        case .platinumPenny: return "Platinum Penny"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let amount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (amount / self.rawValue) * currency.rawValue
        
        return String(format: "%.2f", convertedAmount)
    }
//    
//    static func from(key: String) -> Currency? {
//        Currency.allCases.first { String(describing: $0) == key }
//    }

}

