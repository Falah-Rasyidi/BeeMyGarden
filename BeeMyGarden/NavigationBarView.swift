//
//  NavigationBarView.swift
//  BeeMyGarden
//
//  Created by Falah Rasyidi on 15/7/2025.
//

import SwiftUI

struct NavigationBarView: View {
    let geometry: GeometryProxy
    let onLeftTap: () -> Void
    let onRightTap: () -> Void

    var body: some View {
        HStack {
            Button(action: onLeftTap) {
                Text("<")
                    .font(.system(size: geometry.size.width > 768 ? 19 : 17, weight: .medium))
                    .foregroundColor(.white.opacity(0.96))
                    .background(Circle().fill(.ultraThinMaterial))
            }

            Spacer()

            Text("Plants")
                .font(.system(size: geometry.size.width > 768 ? 29 : 24, weight: .bold))
                .foregroundColor(.white.opacity(0.96))

            Spacer()

            Button(action: onRightTap) {
                Text(">")
                    .font(.system(size: geometry.size.width > 768 ? 19 : 17, weight: .medium))
                    .foregroundColor(.white.opacity(0.96))
                    .background(Circle().fill(.ultraThinMaterial))
            }
        }
        .padding(.horizontal, geometry.size.width > 768 ? 24 : 16)
        .frame(height: geometry.size.width > 768 ? 92 : 72)
    }
}
