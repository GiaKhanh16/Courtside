	 // Welcome.swift
import SwiftUI
import Glur
import SwiftUIGradientBlur

struct Welcome: View {
	 @Binding var isLoggedIn: Bool // Add binding for isLoggedIn

	 var body: some View {
			NavigationStack {
				 ZStack {
						GradientImageView(
							 image: Image(.welcome),
							 height: UIScreen.main.bounds.height,
							 width: UIScreen.main.bounds.width,
							 blurStyle: .dark
						)
						.ignoresSafeArea()

						VStack(spacing: 16) {
							 Spacer()
									.frame(height: 370)
							 Text("Courtside")
									.fontWeight(.medium)
									.fontDesign(.monospaced)
									.font(.largeTitle)
									.foregroundColor(.white)
									.frame(maxWidth: .infinity, alignment: .leading)
							 Text("Reserve Tennis, Badmin, Pickleball Courts")
									.frame(maxWidth: .infinity, alignment: .leading)
									.foregroundStyle(.white)

							 Button {
									isLoggedIn = true // Toggle isLoggedIn to true
							 } label: {
									Text("Sign in with email")
										 .foregroundStyle(.black)
										 .fontWeight(.light)
										 .padding(.horizontal, 75)
										 .padding(.vertical)
										 .background(.white.mix(with: .cyan, by: 0.2))
										 .cornerRadius(10)
										 .offset(y: 20)
							 }

							 Button {
									print("hello world")
							 } label: {
									Text("Sign in with Apple")
										 .foregroundStyle(.black)
										 .fontWeight(.light)
										 .padding(.horizontal, 75)
										 .padding(.vertical)
										 .background(.yellow.mix(with: .cyan, by: 0.2))
										 .cornerRadius(10)
										 .offset(y: 22)
							 }
						}
						.padding(.horizontal)
				 }
			}
	 }
}

#Preview {
	 Welcome(isLoggedIn: .constant(false)) // Use constant for preview
}
