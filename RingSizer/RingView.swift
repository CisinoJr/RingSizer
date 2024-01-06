//
//  RingView.swift
//  RingSizer
//
//  Created by Cisino Junior on 06/01/24.
//

import SwiftUI


struct RingView: View {
	let ringDiameter: CGFloat
	let calibrationWidth: CGFloat = 4.57
	let geometry: GeometryProxy
	let ringSize: String

	var body: some View {
		let diameterInPoints = self.calculateDiameterInPoints(sizeInCentimeters: self.ringDiameter, calibrationWidth: self.calibrationWidth)

		return Circle()
			.stroke(Color.blue, lineWidth: 0.5)
			.frame(width: diameterInPoints, height: diameterInPoints)
			.position(x: self.geometry.size.width / 2, y: self.geometry.size.height / 2)
			.overlay {
				Text(self.ringSize)
					.bold()
			}
	}

	private func calculateDiameterInPoints(sizeInCentimeters: CGFloat, calibrationWidth: CGFloat) -> CGFloat {
		let conversionFactor = calibrationWidth / self.geometry.size.width
		return sizeInCentimeters / conversionFactor
	}
}
