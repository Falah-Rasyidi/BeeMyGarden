//
//  ContentView.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 13/7/2025.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    let tabs = ["Plants", "Tools", "Objects", "Growth"]
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

// MARK: - Tab Button
struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text("#")
                    .font(.system(size: 19, weight: .medium))
                    .frame(width: 44, height: 24)
                Text(title)
                    .font(.system(size: 19, weight: .medium))
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .foregroundColor(isSelected ? .white.opacity(0.96) : .white.opacity(0.23))
            .padding(.vertical, 10)
            .padding(.horizontal, 28)
            .frame(width: 200, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 500)
                    .fill(isSelected ? Color.yellow : Color.clear)
            )
        }
    }
}

// MARK: - Plant Item
struct PlantItem: View {
    let name: String
    var count: Int? = nil
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 8) {
            Text("􀓔")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color(red: 10/255, green: 132/255, blue: 255/255))
                .frame(width: 32, height: 56)

            Text(name)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.white.opacity(0.96))

            Spacer()

            if let count = count {
                Text("\(count)")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white.opacity(0.23))
            }
        }
        .padding(.horizontal, 8)
        .padding(.trailing, 19)
        .frame(height: 56)
        .background(
            RoundedRectangle(cornerRadius: 11)
                .fill(isSelected ? Color.yellow : Color.clear)
        )
        .padding(.horizontal, 12)
    }
}

#Preview {
    ContentView(plants: plantChoices)
}
