import SwiftUI

enum Tabs {
	 case Home
	 case Search
	 case Profile
	 var title: String {
			switch self {
				 case .Home:
						return "Home"
				 case .Search:
						return "Search"
				 case .Profile:
						return "Profile"
			}
	 }
	 var systemImage: String {
			switch self {
				 case .Home:
						return "house.circle.fill"
				 case .Search:
						return "magnifyingglass.circle.fill"
				 case .Profile:
						return "person.crop.circle.fill"
			}
	 }
}


struct AppTab: View {
	 @State var currentTab = Tabs.Home

	 var body: some View {
			TabView(selection: $currentTab) {
				 Tab(Tabs.Home.title, systemImage: Tabs.Home.systemImage, value: .Home) {
						Home()
				 }
				 Tab(Tabs.Search.title, systemImage: Tabs.Search.systemImage, value: .Search) {
						Search()
				 }
				 Tab(Tabs.Profile.title, systemImage: Tabs.Profile.systemImage, value: .Profile) {
						Profile()
				 }
			}
	 }
}
