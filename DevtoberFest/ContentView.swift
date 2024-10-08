// Copyright © 2024 SAP SE or an SAP affiliate company. All rights reserved.

import FioriSwiftUICore
import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            HomeView()
                .tabItem({
                    Label("Home", systemImage: "house.fill")
                })
                .tag(0)
            
            Text("Catalog")
                .tabItem({
                    Label("Catalog", systemImage: "square.and.pencil")
                })
                .tag(1)
            
            Text("Profile")
                .tabItem({
                    Label("Profile", systemImage: "person")
                })
                .tag(2)
            
            Text("Cart")
                .tabItem({
                    Label("Cart", systemImage: "cart")
                })
                .badge("").foregroundColor(Color.blue)
                .tag(3)
        }
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.preferredColor(.primaryLabel))
            UITabBarItem.appearance().badgeColor = UIColor(Color.preferredColor(.negativeLabel))
        }
    }
}

#Preview {
    ContentView()
}
