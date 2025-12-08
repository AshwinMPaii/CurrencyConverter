//
//  ExtractedView.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 07/12/25.
//

import SwiftUI

struct ExtractedView: View {
    
    let leftImage: ImageResource
    let rightImage: ImageResource
    let leftText: String
    let rightText: String
    
    init(leftImage: ImageResource, rightImage: ImageResource, leftText: String, rightText: String) {
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.leftText = leftText
        self.rightText = rightText
    }
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(" \(leftText) = \(rightText)")
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExtractedView(leftImage: .goldpiece, rightImage: .goldpenny, leftText: "Gold Piece", rightText: "Gold Pennies")
}
