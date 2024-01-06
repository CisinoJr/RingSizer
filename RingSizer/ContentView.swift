//
//  ContentView.swift
//  RingSizer
//
//  Created by Cisino Junior on 05/01/24.
//

import SwiftUI

struct ContentView: View {
	@State var ringDiameter: CGFloat = 1.50

	let ringSizes: [String: Float] = [
		"10": 1.50,
		"11": 1.51,
		"12": 1.52,
		"13": 1.60,
		"14": 1.61,
		"15": 1.70,
		"16": 1.71,
		"17": 1.72,
		"18": 1.75,
		"19": 1.80,
		"20": 1.85,
		"21": 1.88,
		"22": 1.90,
		"23": 1.92,
		"24": 1.99,
		"25": 2.00,
		"26": 2.05,
		"27": 2.08,
		"28": 2.11,
		"29": 2.12
	]
	
	var formattedRingSize: String {
		return String(format: "%.2f", self.ringDiameter)
	}

	var filteredItems: [String] {
		return ringSizes
			.filter { String(format: "%.2f", $0.value) == self.formattedRingSize }
			.map { $0.key }
	}

	var body: some View {
        ZStack {
			HStack {
				VStack {
					Text("Qual o tamanho da sua aliança?")
						.padding(.bottom)
						.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
						.bold()
					
					Rectangle()
						.frame(width: 350.00, height: 350.00, alignment: .center)
						.colorInvert()
						.overlay {
							GeometryReader { geometry in
								RingView(ringDiameter: self.ringDiameter, geometry: geometry, ringSize: self.filteredItems.first ?? "")
							}
							.padding()
						}
					
					Slider(value: self.$ringDiameter, in: 1.50...2.12, step: 0.01)
						.padding()
					
					Text("Tamanho da sua aliança:")
						.font(.headline)
						.colorInvert()
						.bold()
						.padding()

					Text(self.filteredItems.first ?? "")
						.font(.headline)
						.bold()
						.padding()
					
					Text("Diametro da aliança: \(self.formattedRingSize)")
						.font(.headline)
				}
			}
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
