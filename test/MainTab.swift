//
//  MainTab.swift
//  test
//
//  Created by 浅沼紅葉 on 2025/04/07.
//

import SwiftUI

struct MainTab: View {
    @StateObject var viewModel = ViewModel()
    @State var section = 0
    
    var body: some View {
        TabView(selection: $section) {
            ContentView(viewModel: viewModel, section: $section)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            SecondView(data: "test", countNumber: 6, viewModel: viewModel)
                .tabItem {
                    Image(systemName: "tray")
                    Text("history")
                }
                .tag(1)
        }
    }
}

#Preview {
    MainTab()
}
