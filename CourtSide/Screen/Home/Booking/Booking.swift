import SwiftUI


struct Booking: View {
	 let club: ClubModel
	 @State private var selectedDate = Date()
	 @State private var startTime = Date()
	 @State private var endTime = Date()
	 @State private var Toggle: Bool = false

	 var duration: String {
			let components = Calendar.current.dateComponents([.hour, .minute], from: startTime, to: endTime)
			let hours = components.hour ?? 0
			let minutes = components.minute ?? 0

			if hours < 0 || (hours == 0 && minutes < 0) {
				 return "Invalid duration"
			}

			return "\(hours)h \(minutes)m"
	 }
	 private let courtAvailability = [true, true, false, true, false, true, true, false]

	 var body: some View {
			ScrollView {


				 Text("Sai Gon Club has 8 courts:")
						.foregroundStyle(.secondary)
						.font(.headline)
						.frame(maxWidth: .infinity, alignment: .leading)
				 LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
						ForEach(1...8, id: \.self) { court in
							 Button {
									Toggle.toggle()
							 } label: {
									Text("Court \(court)")
										 .font(.subheadline)
										 .padding()
										 .frame(maxWidth: .infinity)
										 .background(courtAvailability[court - 1] ? Color.green : Color.gray)
										 .foregroundColor(.white)
										 .clipShape(RoundedRectangle(cornerRadius: 8))
							 }
						}
				 }
				 .padding(.vertical)

				 BookingForm(
						selectedDate: $selectedDate,
						startTime: $startTime,
						endTime: $endTime,
						duration: duration
				 )
				 .padding(.bottom)
			}
			.padding()
			.navigationTitle("Booking Details")
			.navigationBarTitleDisplayMode(.inline)
			.sheet(isPresented: $Toggle) {
				 CourtTime()
			}
	 }
}

#Preview {
	 Booking(club: ClubModel(title: "Can Tho", location: "Ninh Kieu"))
}

struct CourtTime: View {
	 var body: some View {
			Text("List all the time court booked")
	 }
}


struct BookingForm: View {
	 @Binding var selectedDate: Date
	 @Binding var startTime: Date
	 @Binding var endTime: Date
	 var duration: String

	 var body: some View {
			VStack(alignment: .leading, spacing: 10) {
				 HStack {
						Text("Date")
							 .font(.headline)
						DatePicker(
							 "",
							 selection: $selectedDate,
							 in: Date()...,
							 displayedComponents: [.date]
						)
						.datePickerStyle(.compact)
				 }

				 HStack(spacing: 20) {
						Text("Start:")
							 .font(.headline)
						DatePicker(
							 "",
							 selection: $startTime,
							 displayedComponents: [.hourAndMinute]
						)
						.datePickerStyle(.compact)

						Text("End:")
							 .font(.headline)
						DatePicker(
							 "",
							 selection: $endTime,
							 displayedComponents: [.hourAndMinute]
						)
						.datePickerStyle(.compact)
				 }

						// Display the duration
				 HStack {
						Text("Duration:")
							 .font(.headline)
						Text(duration)
							 .font(.body)
				 }
				 .padding(.top, 10)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
	 }
}
