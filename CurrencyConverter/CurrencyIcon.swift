//
//  CurrencyIcon.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 07/12/25.
//

import SwiftUI

struct CurrencyIcon: View {
    
    let currencyImage: ImageResource
    let currencyName: String
    
    init(currencyImage: ImageResource, currencyName: String) {
        self.currencyImage = currencyImage
        self.currencyName = currencyName
    }
    
    var body: some View {
        //Currency icons
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
                
}

#Preview {
   // CurrencyIcon()
}
