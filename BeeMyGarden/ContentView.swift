//
//  ContentView.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 13/7/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Plants"
    @State private var selectedPlant = "Bottle Brush"
    @State private var sidebarVisible = true

    let tabs = ["Plants", "Tools", "Objects", "Growth"]
    let plants = ["Bottle Brush", "Grevillea", "Banksia", "Kangaroo Paw"]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 0) {
                    // Left Floating Tab Bar
                    if geometry.size.width > 768 {
                        VStack(spacing: 0) {
                            ForEach(tabs, id: \.self) { tab in
                                TabButton(
                                    title: tab,
                                    isSelected: tab == selectedTab
                                ) {
                                    selectedTab = tab
                                }
                            }
                        }
                        .padding(.vertical, 12)
                        .frame(width: 155, height: 236)
                        .background(
                            RoundedRectangle(cornerRadius: 34)
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 34)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 1.4)
                                )
                        )
                        .padding(.leading, geometry.size.width > 1200 ? 97 : 16)
                        Spacer()
                    }

                    // Main Area
                    HStack(spacing: 0) {
                        // Content Area
                        VStack(spacing: 0) {
                            // Navigation Bar
                            HStack {
                                Button(action: {
                                    sidebarVisible.toggle()
                                    print("left button pressed")
                                }) {
                                    Text("<")
                                        .font(.system(size: geometry.size.width > 768 ? 19 : 17, weight: .medium))
                                        .foregroundColor(.white.opacity(0.96))
                                        .background(
                                            Circle()
                                                .fill(.ultraThinMaterial)
                                        )
                                }

                                Spacer()

                                Text("Plants")
                                    .font(.system(size: geometry.size.width > 768 ? 29 : 24, weight: .bold))
                                    .foregroundColor(.white.opacity(0.96))

                                Spacer()

                                Button(action: {
                                    print("right button pressed")
                                }) {
                                    Text(">")
                                        .font(.system(size: geometry.size.width > 768 ? 19 : 17, weight: .medium))
                                        .foregroundColor(.white.opacity(0.96))
                                        .background(
                                            Circle()
                                                .fill(.ultraThinMaterial)
                                        )
                                }
                            }
                            .padding(.horizontal, geometry.size.width > 768 ? 24 : 16)
                            .frame(height: geometry.size.width > 768 ? 92 : 72)

                            Spacer()

                            // Plant Image
                            AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/5d236957f4c6bb24da0811d47f393cd4035fe85f?width=828")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.ultraThinMaterial)
                            }
                            .frame(
                                width: geometry.size.width > 768 ? 414 : min(300, geometry.size.width * 0.7),
                                height: geometry.size.width > 768 ? 414 : min(300, geometry.size.width * 0.7)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                            // Plant Description
                            VStack(spacing: geometry.size.width > 768 ? 26 : 16) {
                                Text(selectedPlant)
                                    .font(.system(size: geometry.size.width > 768 ? 27 : 22, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.96))

                                Text("Callistemon is a genus of shrubs in the family Myrtaceae, first described in 1814. The entire genus is endemic to Australia but widely cultivated in other regions.")
                                    .font(.system(size: geometry.size.width > 768 ? 17 : 15))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: 515)
                            .padding(.horizontal, 16)
                            .padding(.top, geometry.size.width > 768 ? 40 : 16)

                            Spacer()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: geometry.size.width > 768 ? 46 : 20, style: .continuous)
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: geometry.size.width > 768 ? 46 : 20)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                )
                        )
                        .padding(geometry.size.width > 768 ? 16 : 8)
                    }
                    .padding(-10)
                }
            }
        }
        .font(.custom("SF Pro", size: 16))
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
                Text("􀓔")
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 500)
                    .fill(isSelected ? Color.blue : Color.clear)
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
                .fill(isSelected ? Color.blue : Color.clear)
        )
        .padding(.horizontal, 12)
    }
}

#Preview {
    ContentView()
}
