import SwiftUI

struct ContentView: View {
	 @State var isLoggedIn: Bool = false

	 var body: some View {
			VStack {
				 if isLoggedIn {
						AppTab()
				 } else {
						Welcome(isLoggedIn: $isLoggedIn)
				 }
			}
			.animation(.easeIn, value: isLoggedIn)
	 }
}

#Preview {
	 AppTab()
}
