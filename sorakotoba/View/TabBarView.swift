import SwiftUI

struct TabBarView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MypageView()
                .tag(1)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("MyPage", systemImage: "person")
                }
            SettingsView()
                .tag(2)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                }
        }
    }
}
