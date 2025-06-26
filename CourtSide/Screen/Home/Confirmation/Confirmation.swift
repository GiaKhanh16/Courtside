import SwiftUI

struct Confirmation: View {

	 var body: some View {
			VStack {
				 Text("Confirm booking")
						.font(.largeTitle)
						.fontWeight(.bold)
						.frame(maxWidth: .infinity, alignment: .leading)
				 Divider()
				 Image(.confirmCourt)
						.resizable()
						.scaledToFit()
						.frame(width: 250, height: 180)
						.padding(40)

				 VStack(spacing:10) {
						Text("Wimbledon\nCenter Court")
							 .font(.title)
							 .fontWeight(.semibold)
							 .multilineTextAlignment(.leading)
							 .frame(maxWidth: .infinity, alignment: .leading)
				 Text("$10.00")
						.font(.title2)
						.fontWeight(.medium)
						.foregroundStyle(.secondary)
						.frame(maxWidth: .infinity, alignment: .leading)
				 }
				 Divider()
						.padding(.bottom, 25)

				 HStack(alignment: .top) {
						VStack(spacing: 5) {
							 Text("Time")
									.font(.title3)
									.fontWeight(.regular)
									.foregroundStyle(.secondary)
									.frame(maxWidth: .infinity, alignment: .leading)
							 Text("September 25\n15:00")
									.font(.title2)
									.fontWeight(.medium)
									.foregroundStyle(.primary)
									.frame(maxWidth: .infinity, alignment: .leading)
									.multilineTextAlignment(.leading)
						}
						VStack(spacing: 5) {
							 Text("Duration")
									.font(.title3)
									.fontWeight(.medium)
									.foregroundStyle(.secondary)
									.frame(maxWidth: .infinity, alignment: .trailing)
							 Text("1 hr")
									.font(.title2)
									.fontWeight(.medium)
									.foregroundStyle(.primary)
									.frame(maxWidth: .infinity, alignment: .trailing)
									.multilineTextAlignment(.leading)
						}
				 }
				 Button {

				 } label: {
						Text("Confirm Booking")
							 .foregroundStyle(.white)
							 .padding()
							 .frame(maxWidth: .infinity)
							 .background(.blue)
							 .cornerRadius(10)
							 .padding(.top, 25)

				 }
Spacer()


			}
			.padding()
			.padding(.horizontal, 20)
	 }
}

#Preview {
	 Confirmation()
}
