//
//  ContentView.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/01.
//

import SwiftUI

struct ContentView: View {
    @State private var bounce = false
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                
                Image("resized-pop")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding()
                
                NavigationLink(destination: startView()
                    .navigationBarBackButtonHidden(true)){
                        ZStack{
                            Rectangle()
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .background(Color.orange)
                                .frame(width: 200, height: 67)
                                .cornerRadius(20)
                            Text("スタート▶️")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                            
                        }//inner Zstack
                        .offset(y: bounce ? -10: 10)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                self.bounce.toggle()
                            }
                        }
                        
                    }//navigation link ends
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{Color.black.ignoresSafeArea()}
        }
        .navigationTitle("Main screen")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        
    }
}//body ends


#Preview {
    ContentView()
}
