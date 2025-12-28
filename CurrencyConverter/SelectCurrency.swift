//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 07/12/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Text
                Text("Select the currecny you are starting with:")
                    .fontWeight(.bold)
                
                IconGrid(selectedCurrency: $topCurrency)
                
                Spacer()
                
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                //Currency icons
                IconGrid(selectedCurrency: $bottomCurrency)
                
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
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

//#Preview {
//    @Previewable @State var topCurrency: Currency = .silverPenny
//    @Previewable @State var bottomCurrency: Currency = .goldPiece
//    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
//}
