//
//  footerView.swift
//  BuBeeFinal
//
//  Created by 최주현 on 5/28/24.
//

import SwiftUI

struct Putter: View {
    init() {
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "Color")
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "Color")!]
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView {
            UniversityView() // 이름은 각자 페이지에 맞게 바꾸어 주세요
                .tabItem {
                    Label("Uni.", systemImage: "building.columns")
                        
                }
            ClubView() // 이름은 각자 페이지에 맞게 바꾸어 주세요/
                .tabItem {
                    Label("Club", systemImage: "graduationcap")
                }
            NotificationView() // 이름은 각자 페이지에 맞게 바꾸어 주세요/
                .tabItem{
                    Label("Notif.", systemImage: "bell.badge")
                }
//            Personal_StudentCouncil()
//                .tabItem{
//                    Label("User", systemImage: "person.fill")
//                }
        }
        
    }
}

// 예제
struct UniversityView: View {
    var body: some View {
        NavigationView {
            Text("First View")
                .navigationBarTitle("First", displayMode: .inline)
        }
    }
}

struct ClubView: View {
    var body: some View {
        NavigationView {
            Text("Second View")
                .navigationBarTitle("Second", displayMode: .inline)
        }
    }
}
struct NotificationView: View {
    var body: some View {
        NavigationView {
            Text("Third View")
                .navigationBarTitle("Third", displayMode: .inline)
        }
    }
}

#Preview {
    Putter()
}
