//
//  CurrencyTip.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 22/12/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change currency")
    
    var message: Text? = Text("Use the currency picker to switch between currencies.")

    var image: Image? = Image(systemName: "hand.tap.fill")
}
