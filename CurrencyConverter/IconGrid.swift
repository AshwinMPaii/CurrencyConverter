//
//  IconGrid.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 07/12/25.
//

import SwiftUI

struct IconGrid: View {
    
    @Binding var selectedCurrency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.text)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.text)
                        .onTapGesture {
                            self.selectedCurrency = currency
                        }
                }
            }
        }
    }
}

//#Preview {
//    @Previewable @State var selectedCurrency: Currency = .silverPiece
//    IconGrid(selectedCurrency: $selectedCurrency)
//}
