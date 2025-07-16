//
//  ContentView.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 13/7/2025.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    let plants: [Plant]
    
    @State private var selectedTab = "Plants"
    @State private var sidebarVisible = true
    @State private var index = 0
    
    init(plants: [Plant]) {
        self.plants = plants
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            HStack {
                VStack(spacing: 24) {
                    IconTabButton(
                        iconName: "cube.fill",
                        isSelected: "Objects" == selectedTab
                    ) {
                        selectedTab = "Objects"
                    }
                    
                    IconTabButton(
                        iconName: "leaf.fill",
                        isSelected: "Plants" == selectedTab
                    ) {
                        selectedTab = "Plants"
                    }
                    
                    IconTabButton(
                        iconName: "tree.fill",
                        isSelected: "Growth" == selectedTab
                    ) {
                        selectedTab = "Growth"
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 86, style: .continuous)
                        .fill(Color.black.opacity(0.45))
                        .overlay(
                            RoundedRectangle(cornerRadius: 86)
                                .stroke(Color.white.opacity(0.4), lineWidth: 1.4)
                        )
                )
                .frame(width: 170)
                .padding(.leading, geometry.size.width > 1200 ? 97 : 16)

                HStack(alignment: .center, spacing: 100) {
                    Button(action: {
                        index -= 1
                    }) {
                        Label("", systemImage: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44, alignment: .center)
                            .background(Color(red: 0.37, green: 0.37, blue: 0.37).opacity(0.18))
                            .background(Color.white.opacity(0.86))
                            .cornerRadius(500)
                    }
                    .offset(x: 50)
                    .frame(width: 44, height: 44, alignment: .center)
                    
                    PlantDetailView(
                        geometry: geometry,
                        plantName: plants[abs(index) % plants.count].plantName,
                        plantFile: plants[abs(index) % plants.count].plantFile,
                        plantDescription: plants[abs(index) % plants.count].plantDescription
                    )
                    .padding(.bottom, 35)
                    
                    Button(action: {
                        index += 1
                    }) {
                        Label("", systemImage: "chevron.right")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44, alignment: .center)
                            .background(Color(red: 0.37, green: 0.37, blue: 0.37).opacity(0.18))
                            .background(Color.white.opacity(0.86))
                            .cornerRadius(500)
                    }
                    .offset(x: -50)
                    .frame(width: 44, height: 44, alignment: .center)
                }
                .background(
                    RoundedRectangle(cornerRadius: geometry.size.width > 768 ? 46 : 20, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: geometry.size.width > 768 ? 46 : 20)
                                .stroke(Color.white.opacity(0.4), lineWidth: 1)
                        )
                )
            }
            }
    }
}

#Preview {
    ContentView(plants: plantChoices)
}

/// MARK - Icon Tab Button
struct IconTabButton: View {
    let iconName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .padding(18)
                .frame(width: 72, height: 72)
                .foregroundColor(isSelected ? .white : .white.opacity(0.6))
                .background(
                    Circle()
                        .fill(isSelected ? Color.white.opacity(0.15) : Color.clear)
                )
        }
        .buttonStyle(.plain)
    }
}
