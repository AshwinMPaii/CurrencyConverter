//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 05/12/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                //Description
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black.opacity(0.7))
                    .clipShape(.buttonBorder)
                    
                //Rates
                ExtractedView(leftImage: .platinumpenny, rightImage: .goldpenny, leftText: "0.25 Platinum Penny", rightText: "1 Gold Piece")
                ExtractedView(leftImage: .goldpiece, rightImage: .goldpenny, leftText: "1 Gold Piece", rightText: "4 Gold Pennies")
                ExtractedView(leftImage: .goldpenny, rightImage: .silverpiece, leftText: "1 Gold Penny", rightText: "4 Silver Pieces")
                ExtractedView(leftImage: .silverpiece, rightImage: .silverpenny, leftText: "1 Silver Piece", rightText: "4 Silver Pennies")
                ExtractedView(leftImage: .silverpenny, rightImage: .copperpenny, leftText: "1 Silver Penny", rightText: "100 Copper Pennies")
                
                //Done
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title)
                .padding()
                .foregroundStyle(.white)
                
                
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

