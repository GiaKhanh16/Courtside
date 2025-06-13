import SwiftUI

struct Search: View {
	 @State private var searchText: String = ""
	 var body: some View {
			NavigationStack {
				 List {
						Section(header: Text("Register to reserve court.")) {
							 ForEach(filteredClub) { club in
									VStack(alignment: .leading, spacing: 8) {
										 Text(club.title)
												.font(.headline)
												.foregroundColor(.primary)

										 Text("Location: \(club.location)")
												.font(.subheadline)
												.foregroundColor(.secondary)
									}
							 }
						}
				 }
				 .padding(.vertical)
				 .searchable(text: $searchText)
				 .listStyle(.plain)
				 .navigationTitle("Register")
				 .toolbarBackground(.visible, for: .navigationBar)
				 .toolbarBackground(
						Color(.white).mix(with: .cyan, by: 0.2),
						for: .navigationBar
				 )
				 .toolbar {
						ToolbarItem(placement: .topBarTrailing) {
							 Image(systemName: "line.3.horizontal.decrease.circle")
						}
				 }
			}
	 }

	 private var filteredClub: [ClubModel] {
			return sampleClubs.filter {
				 searchText.isEmpty ||
				 $0.title.lowercased().contains(searchText.lowercased()) ||
				 $0.location.lowercased().contains(searchText.lowercased())
			}
	 }
}

#Preview {
	 Search()
}
