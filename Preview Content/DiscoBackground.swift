//
//  DiscoBackground.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/10.
//

import SwiftUI

struct DiscoBackground: View {
    @State private var animate = false
       @State private var spin = false
       
       var body: some View {
           ZStack {
               // 1️⃣ Moving color gradient base
               AngularGradient(
                   gradient: Gradient(colors: [
//                    .gray,
                    .purple, .orange, .blue, .cyan, .yellow, .red, .purple
                   ]),
                   center: .center
               )
               .rotationEffect(.degrees(spin ? 360 : 0))
               .animation(.linear(duration: 20).repeatForever(autoreverses: false), value: spin)
               .ignoresSafeArea()
               
               // 2️⃣ Soft rotating light beams
               ForEach(0..<6) { i in
                   RoundedRectangle(cornerRadius: 100)
                       .fill(
                           LinearGradient(
                               colors: [Color.white.opacity(0.15), Color.clear],
                               startPoint: .top,
                               endPoint: .bottom
                           )
                       )
                       .frame(width: 100, height: 800)
                       .rotationEffect(.degrees(Double(i) * 60 + (animate ? 45 : 0)))
                       .offset(y: -100)
                       .blendMode(.screen)
                       .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: animate)
               }
               
               // 3️⃣ Pulsing disco spotlight (center)
               RadialGradient(
                   gradient: Gradient(colors: [
                       .white.opacity(0.6),
                       .clear
                   ]),
                   center: .center,
                   startRadius: 60,
                   endRadius: 400
               )
               .blendMode(.plusLighter)
               .blur(radius: 60)
               .scaleEffect(animate ? 1.1 : 0.9)
               .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)
               
               // 4️⃣ Glitter sparkles
               ZStack {
                   ForEach(0..<25) { i in
                       Circle()
                           .fill(Color.white.opacity(Double.random(in: 0.3...0.8)))
                           .frame(width: CGFloat.random(in: 2...5), height: CGFloat.random(in: 2...5))
                           .position(
                               x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                               y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                           )
                           .opacity(animate ? 1 : 0.3)
                           .animation(
                               Animation.easeInOut(duration: Double.random(in: 1.5...3))
                                   .repeatForever(autoreverses: true)
                                   .delay(Double(i) * 0.1),
                               value: animate
                           )
                   }
               }
               .blendMode(.screen)
           }
           .ignoresSafeArea()
           .onAppear {
               animate = true
               spin = false
           }
       }
   }

   #Preview {
       ZStack {
           DiscoBackground()
          
       }
   }
