//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Ashwin Pai on 01/12/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftCurrency: Currency = .silverPenny
    
    @State var rightCurrency: Currency = .goldPenny
    
    func saveCurrency() {
        let defaults = UserDefaults.standard
        defaults.set(leftCurrency.rawValue, forKey: "leftCurrency")
        defaults.set(rightCurrency.rawValue, forKey: "rightCurrency")
    }
    
    func loadCurrency() {
        let defaults = UserDefaults.standard
        
        // 1. Get the doubles from storage
        let leftRaw = defaults.double(forKey: "leftCurrency")
        let rightRaw = defaults.double(forKey: "rightCurrency")
        
        // 2. Convert back to Enum (only if they exist/are valid)
        if let left = Currency(rawValue: leftRaw) {
            leftCurrency = left
        }
        if let right = Currency(rawValue: rightRaw) {
            rightCurrency = right
        }
    }
    
    func dismissKeyboard() {
        leftTyping = false
        rightTyping = false
    }
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    var currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .onTapGesture {
                    dismissKeyboard()
                }
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //input currency text
                            Text(leftCurrency.text)
                                .font(.title3)
                                .foregroundStyle(.white)
                
                        }
                        .padding(.bottom, -1)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        //input text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        
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
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //output currency text
                            Text(rightCurrency.text)
                                .font(.title3)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -1)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        //output text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
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
                }
                
            }
        }
        .task {
            try? Tips.configure()
        }
        .onAppear {
            loadCurrency() // Loads the saved currency when the app opens
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            saveCurrency()
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            saveCurrency()
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView(leftCurrency: .silverPenny, rightCurrency: .goldPenny)
}
