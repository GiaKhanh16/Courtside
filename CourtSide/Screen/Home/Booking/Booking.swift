import SwiftUI


struct Booking: View {
	 let club: ClubModel
	 @State private var selectedDate = Date()
	 @State private var startTime = Date()
	 @State private var endTime = Date()
	 @State private var selectedCourt: Int? = nil // Changed to single optional Int

	 var duration: String {
			let components = Calendar.current.dateComponents([.hour, .minute], from: startTime, to: endTime)
			let hours = components.hour ?? 0
			let minutes = components.minute ?? 0

			if hours < 0 || (hours == 0 && minutes < 0) {
				 return "Invalid duration"
			}

			return "\(hours)h \(minutes)m"
	 }

	 var courtName: String {
			if let court = selectedCourt {
				 return "Court \(court)"
			}
			return "No court selected"
	 }

	 var body: some View {
			ScrollView {
				 Group {
						Text("Sai Gon Club has 8 courts:")
							 .foregroundStyle(.secondary)
							 .font(.headline)
							 .frame(maxWidth: .infinity, alignment: .leading)
						LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
							 ForEach(1...8, id: \.self) { court in
									Button {
										 if selectedCourt == court {
												selectedCourt = nil // Deselect if already selected
										 } else {
												selectedCourt = court // Select new court
										 }
									} label: {
										 HStack {
												Text("Court \(court)")
												Spacer()
												if selectedCourt == court {
													 Image(systemName: "checkmark.circle.fill")
															.resizable()
															.frame(width: 15, height: 15)
												}
										 }
										 .foregroundStyle(.white)
										 .font(.headline)
										 .frame(maxWidth: .infinity)
										 .padding()
										 .background(Color.green)
										 .cornerRadius(10)
									}
							 }
						}
						.padding(.vertical, 5)
				 }
				 .padding(.horizontal)

				 BookingForm(
						selectedDate: $selectedDate,
						startTime: $startTime,
						endTime: $endTime,
						duration: duration,
						courtName: courtName
				 )
				 .padding(.bottom)
			}
			.padding(.vertical)
			.navigationTitle("Booking Details")
			.navigationBarTitleDisplayMode(.inline)
	 }
}

struct BookingForm: View {
	 @Binding var selectedDate: Date
	 @Binding var startTime: Date
	 @Binding var endTime: Date
	 var duration: String
	 var courtName: String

	 var body: some View {
			VStack(alignment: .leading, spacing: 5) {
				 Group {
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

						HStack {
							 Text("Duration:")
									.font(.headline)
							 Text(duration)
									.font(.body)
						}
						.padding(.top, 5)
				 }
				 .padding(.horizontal)
				 TimeSlotsView(courtName: courtName)
						.padding(.top, 10)
				 Button {
						print("hello world")
				 } label: {
						Text("Book Court")
							 .foregroundStyle(.white)
							 .frame(maxWidth: .infinity)
							 .padding()
							 .background(Color.blue)
							 .cornerRadius(10)
				 }
				 .padding(10)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
	 }
}

struct TimeSlotsView: View {
	 var courtName: String
	 @State private var startHour: Int = 8
	 @State private var endHour: Int = 18
	 @State private var selectedSlots: Set<Date> = []

	 private func generateTimeSlots(startHour: Int, endHour: Int) -> [(start: Date, end: Date)] {
			var slots: [(start: Date, end: Date)] = []
			let calendar = Calendar.current
			let startDate = calendar.date(bySettingHour: startHour, minute: 0, second: 0, of: Date())!

			let totalMinutes = (endHour - startHour) * 60
			let numberOfSlots = totalMinutes / 30

			for i in 0..<numberOfSlots {
				 let start = calendar.date(byAdding: .minute, value: i * 30, to: startDate)!
				 let end = calendar.date(byAdding: .minute, value: 30, to: start)!
				 slots.append((start, end))
			}

			return slots
	 }

	 private func formatTimeSlot(start: Date, end: Date) -> String {
			let formatter = DateFormatter()
			formatter.dateFormat = "HH:mm"
			let startTime = formatter.string(from: start)
			let endTime = formatter.string(from: end)
			return "\(startTime)-\(endTime)"
	 }

	 var body: some View {
			VStack(alignment: .leading) {
				 Text("Select time slots for: \(courtName)")
						.font(.subheadline)
						.foregroundStyle(.gray)
						.padding(.leading)

				 ScrollView(.horizontal, showsIndicators: false) {
						HStack {
							 ForEach(Array(generateTimeSlots(startHour: startHour, endHour: endHour).enumerated()), id: \.element.start) { index, slot in
									Button(action: {
										 if selectedSlots.contains(slot.start) {
												selectedSlots.remove(slot.start)
										 } else {
												selectedSlots.insert(slot.start) // Fixed to insert slot.start
										 }
									}) {
										 Text(formatTimeSlot(start: slot.start, end: slot.end))
												.foregroundStyle(.black)
												.padding()
												.padding(.horizontal, 20)
												.background(selectedSlots.contains(slot.start) ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2))
												.cornerRadius(8)
									}
									.padding(.leading, index == 0 ? 10 : 0)
							 }
						}
				 }
			}
	 }
}

#Preview {
	 Booking(club: ClubModel(title: "Can Tho", location: "Ninh Kieu"))
}
