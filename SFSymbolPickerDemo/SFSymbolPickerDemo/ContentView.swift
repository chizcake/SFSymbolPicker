//
//  ContentView.swift
//  SFSymbolPickerDemo
//
//  Created by Henry Yoo on 3/31/24.
//

import SFSymbolPicker
import SwiftUI

struct ContentView: View {
    @State private var isPickerPresented = false
    @State private var selectedSymbol: String?
    
    var body: some View {
        VStack {
            Button {
                isPickerPresented.toggle()
            } label: {
                Text("Present SFSymbolPicker")
            }
        }
        .padding()
        .sheet(isPresented: $isPickerPresented) {
            SFSymbolPicker(selectedSymbol: $selectedSymbol)
        }
    }
}

#Preview {
    ContentView()
}
