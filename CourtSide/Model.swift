//
//  Model.swift
//  CourtSide
//
//  Created by Khanh Nguyen on 6/11/25.
//
import Foundation

struct ClubModel: Identifiable {
	 let id = UUID()
	 let title: String
	 let location: String
}

let sampleClubs = [
	 ClubModel(
			title: "Sunny Hills Tennis Club",
			location: "San Diego, CA"
	 ),
	 ClubModel(
			title: "Green Valley Racket Club",
			location: "Miami, FL"
	 ),
	 ClubModel(
			title: "Pinewood Tennis Academy",
			location: "Chicago, IL"
	 ),
	 ClubModel(
			title: "Elite Tennis Center",
			location: "New York, NY"
	 )
]
