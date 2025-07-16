//
//  BeeYourGardenView.swift
//  BeeMyGarden
//
//  Created by 杨馥遥 on 15/7/2025.
//


import SwiftUI

struct BeeYourGardenView: View {
    var body: some View {
        ZStack {
            
            // 主窗口容器
            VStack(spacing: 0) {
                // 窗口控件
                WindowControls()
                
                // 主窗口
                MainWindow()
            }
            .frame(maxWidth: 1280, maxHeight: 720)
            .padding(.horizontal, 16)
        }
    }
}

struct WindowControls: View {
    var body: some View {
        HStack {
            Spacer()
            
            // Grabber (拖拽条)
            Capsule()
                .fill(Color.white.opacity(0.3))
                .frame(width: 136, height: 10)
                .blur(radius: 1)
            
            Spacer()
            
            // Close Button
            Circle()
                .fill(Color.white.opacity(0.3))
                .frame(width: 14, height: 14)
                .blur(radius: 1)
                .padding(.trailing, 46)
        }
        .frame(height: 37)
    }
}

struct MainWindow: View {
    var body: some View {
        ZStack {
            // 玻璃拟态背景
            RoundedRectangle(cornerRadius: 46)
                .fill(Color.gray.opacity(0.3))
                .background(
                    RoundedRectangle(cornerRadius: 46)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                .blur(radius: 25)
            
            // 内容容器
            VStack(spacing: 24) {
                // 蜜蜂Logo
                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/bbd33a62354c5df8c4de0955db71e791c082bddd")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Circle()
                        .fill(Color.yellow.opacity(0.3))
                }
                .frame(width: 177, height: 177)
                
                // 主标题
                Text("Bee your Garden")
                    .font(.custom("SF Pro", size: 70))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                // 副标题
                Text("Bring your vision to life — for you, and for the planet")
                    .font(.custom("SF Pro", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            .padding(64)
            .offset(x: -5) // 对应marginLeft: "-5px"
        }
        .clipShape(RoundedRectangle(cornerRadius: 46))
    }
}

// 响应式版本 - 适配不同屏幕尺寸
struct ResponsiveBeeYourGardenView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isCompact: Bool {
        horizontalSizeClass == .compact || verticalSizeClass == .compact
    }
    
    var body: some View {
        ZStack {
            Color(red: 253/255, green: 183/255, blue: 19/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ResponsiveWindowControls()
                ResponsiveMainWindow()
            }
            .frame(maxWidth: isCompact ? nil : 1280, maxHeight: isCompact ? nil : 720)
            .padding(.horizontal, isCompact ? 16 : 0)
        }
    }
}

struct ResponsiveWindowControls: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var isCompact: Bool {
        horizontalSizeClass == .compact
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            Capsule()
                .fill(Color.white.opacity(0.3))
                .frame(width: isCompact ? 100 : 136, height: 10)
                .blur(radius: 1)
            
            Spacer()
            
            if !isCompact {
                Circle()
                    .fill(Color.white.opacity(0.3))
                    .frame(width: 14, height: 14)
                    .blur(radius: 1)
                    .padding(.trailing, 46)
            }
        }
        .frame(height: 37)
    }
}

struct ResponsiveMainWindow: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isCompact: Bool {
        horizontalSizeClass == .compact || verticalSizeClass == .compact
    }
    
    var logoSize: CGFloat {
        if isCompact {
            return 80
        } else {
            return 177
        }
    }
    
    var titleFontSize: CGFloat {
        if isCompact {
            return 24
        } else {
            return 64
        }
    }
    
    var subtitleFontSize: CGFloat {
        if isCompact {
            return 16
        } else {
            return 32
        }
    }
    
    var cornerRadius: CGFloat {
        if isCompact {
            return 24
        } else {
            return 46
        }
    }
    
    var padding: CGFloat {
        if isCompact {
            return 32
        } else {
            return 64
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.gray.opacity(0.3))
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.white.opacity(0.4), lineWidth: 1)
                )
                .blur(radius: 25)
            
            VStack(spacing: isCompact ? 16 : 24) {
                AsyncImage(url: URL(string: "https://cdn.builder.io/api/v1/image/assets/TEMP/bbd33a62354c5df8c4de0955db71e791c082bddd")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Circle()
                        .fill(Color.yellow.opacity(0.3))
                }
                .frame(width: logoSize, height: logoSize)
                
                Text("Bee your Garden")
                    .font(.custom("SF Pro", size: titleFontSize))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text("Bring your vision to life — for you, and for the planet")
                    .font(.custom("SF Pro", size: subtitleFontSize))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, isCompact ? 16 : 32)
            }
            .padding(padding)
            .offset(x: -5)
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

// App文件
struct BeeYourGardenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview {
    BeeYourGardenView()
}
