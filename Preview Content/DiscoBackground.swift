//
//  DiscoBackground.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/10.
//

import SwiftUI

struct DiscoBackground: View {
    @State private var animate = false
    @State private var slowRotate = false
    
    var body: some View {
        ZStack {
            // 1️⃣ Lighter sophisticated base gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.12, green: 0.12, blue: 0.22),
                    Color(red: 0.18, green: 0.12, blue: 0.28),
                    Color(red: 0.12, green: 0.18, blue: 0.24)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // 2️⃣ Moderately paced accent gradient overlay
            AngularGradient(
                gradient: Gradient(colors: [
                    Color.purple.opacity(0.25),
                    Color.blue.opacity(0.3),
                    Color.indigo.opacity(0.25),
                    Color.purple.opacity(0.25)
                ]),
                center: .center
            )
            .rotationEffect(.degrees(slowRotate ? 360 : 0))
            .animation(.linear(duration: 40).repeatForever(autoreverses: false), value: slowRotate)
            .ignoresSafeArea()
            
            // 3️⃣ Elegant light rays (fewer, more subtle)
            ForEach(0..<4) { i in
                RoundedRectangle(cornerRadius: 100)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.03), Color.clear],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 120, height: 900)
                    .rotationEffect(.degrees(Double(i) * 90 + (animate ? 20 : -20)))
                    .offset(y: -150)
                    .blendMode(.screen)
                    .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true).delay(Double(i) * 0.5), value: animate)
            }
            
            // 4️⃣ Soft ambient glow
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.08),
                    Color.purple.opacity(0.05),
                    Color.clear
                ]),
                center: .center,
                startRadius: 50,
                endRadius: 500
            )
            .blendMode(.screen)
            .blur(radius: 80)
            .scaleEffect(animate ? 1.15 : 1.0)
            .animation(.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
            
            // 5️⃣ Refined subtle sparkles
            ZStack {
                ForEach(0..<8) { i in
                    Circle()
                        .fill(Color.white.opacity(Double.random(in: 0.2...0.4)))
                        .frame(width: CGFloat.random(in: 1.5...3), height: CGFloat.random(in: 1.5...3))
                        .position(
                            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                            y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                        )
                        .opacity(animate ? 0.6 : 0.2)
                        .animation(
                            Animation.easeInOut(duration: Double.random(in: 3...5))
                                .repeatForever(autoreverses: true)
                                .delay(Double(i) * 0.3),
                            value: animate
                        )
                }
            }
            .blendMode(.screen)
            
            // 6️⃣ Noise texture overlay for depth
            Rectangle()
                .fill(Color.white.opacity(0.02))
                .ignoresSafeArea()
                .blendMode(.overlay)
        }
        .ignoresSafeArea()
        .onAppear {
            animate = true
            slowRotate = true
        }
    }
}

   #Preview {
       ZStack {
           DiscoBackground()
          
       }
   }
