//
//  PlantDetailView.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 15/7/2025.
//

import SwiftUI
import RealityKit

struct PlantDetailView: View {
    let geometry: GeometryProxy
    let plantName: String
    let plantFile: String
    let plantDescription: String

    var body: some View {
        VStack(spacing: 10) {
            Model3D(named: plantFile) {
                model in
                model
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                
            }
            
            Spacer()
            
            Text(plantName)
                .font(.extraLargeTitle)
//                .font(.system(size: geometry.size.width > 768 ? 27 : 22, weight: .semibold))
                .foregroundColor(.white.opacity(0.96))
            
            Spacer()
            
            Text(plantDescription)
                .font(.system(size: geometry.size.width > 768 ? 27 : 37))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 1000)
        .padding(.horizontal, 16)
        .padding(.top, geometry.size.width > 768 ? 40 : 16)
    }
}
