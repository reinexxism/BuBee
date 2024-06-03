//
//  ContentView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView(selection: .constant(1)) {
                mainView()
                .tabItem {
                    Label("Main", systemImage: "house.fill")
                }
                .foregroundColor(.black)
                Personal_StudentCouncil()
                    .tabItem {
                        Label("MY", systemImage: "person.fill")
                    }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
