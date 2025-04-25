//
//  ContentView.swift
//  test
//
//  Created by 浅沼紅葉 on 2025/04/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented = false
    @StateObject var viewModel: ViewModel
    @Binding var section: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "fitness.timer")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                Text("counter start!").font(.system(size: 40, weight: .bold, design: .default))
                
                
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                }
            }
            .padding()
            .navigationDestination(isPresented: $isPresented) {
                counterView(viewModel: viewModel, section: $section)
            }
        }
    }
}

//#Preview {
//    ContentView(viewModel: ViewModel())
//}
