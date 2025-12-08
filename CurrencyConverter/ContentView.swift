//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 01/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                //prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //currency converter text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //conversion section
                HStack {
                    //left conversion section
                    VStack {
                        //upper section
                        HStack {
                            //input currency image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //input currency text
                            Text("Silver Piece")
                                .font(.title2)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -1)
                        //input text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            //.padding()
                        
                    }
                    
                    //equal to symbol
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //right conversion section
                    VStack {
                        //upper section
                        HStack {
                            //output currency image
                            Image(.goldpenny)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //output currency text
                            Text("Gold Piece")
                                .font(.title2)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -1)
                        //output text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            //.padding()
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                //info section
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                        print("showExchangeInfo: \(showExchangeInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
