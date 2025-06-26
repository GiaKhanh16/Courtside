import SwiftUI

struct Home: View {
	 @State private var searchText: String = ""
	 var body: some View {
			NavigationStack {
				 List (sampleClubs) { club in
						NavigationLink {
							 Booking(club: club)
									.toolbar(.hidden, for: .tabBar)
						} label: {
							 VStack(alignment: .leading, spacing: 8) {
									Text(club.title)
										 .font(.headline)
										 .foregroundColor(.primary)

									Text("Location: \(club.location)")
										 .font(.subheadline)
										 .foregroundColor(.secondary)
							 }
							 .padding(.vertical, 4)
						}
				 }
				 .listStyle(.plain)
				 .searchable(text: $searchText)
				 .navigationTitle("My Clubs")
				 .toolbarBackground(.visible, for: .navigationBar)
				 .toolbarBackground(
						Color(.white).mix(with: .blue, by: 0.2),
						for: .navigationBar
				 )
				 .toolbar {
						ToolbarItem(placement: .topBarTrailing) {
							 Image(systemName: "line.3.horizontal.decrease.circle")
						}
				 }
			}
	 }
}

#Preview {
	 Home()
}
