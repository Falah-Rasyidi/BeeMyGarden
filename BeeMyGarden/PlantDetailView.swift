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
                Image(systemName: "ellipsis")
                    .font(.custom("Arial", size: 100))
                    .padding(.top, 300)
            }

            Spacer()
            
            Text(plantName)
                .font(.extraLargeTitle)
                .foregroundColor(.white.opacity(0.96))
                .transition(.opacity)
                .animation(.default, value: plantName)
            
            Spacer()
            
            Text(plantDescription)
                .font(.system(size: geometry.size.width > 768 ? 27 : 37))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .transition(.opacity)
                .animation(.default, value: plantName)
        }
        .frame(maxWidth: 1000)
        .padding(.horizontal, 16)
        .padding(.top, geometry.size.width > 768 ? 40 : 16)
    }
}
