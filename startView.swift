//
//  startView.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/17.
//

import SwiftUI

struct startView: View {
    @StateObject private var vm = DollViewModel()
    @State private var selectedCategory: CategoryType = .hair
    @State private var animate = true
    @State private var shareImage: UIImage? = nil
    @State private var showShare: Bool = false
    @State private var soundToggle: Bool = true

    
    var body: some View {
        //doll display
        VStack(spacing: 2){
            //Doll display
            Spacer()
            //inorder to limit the doll's view space
            ZStack{
                
                ForEach(selectedItemsSorted(), id: \.id) { item in
                    if vm.gender == .male {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 700, height: 700)
                    } else {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                    }
                }
            }//doll display ends
            .frame(height: UIScreen.main.bounds.height * 0.4) // about 40% of screen
            .frame(maxWidth: .infinity)
            Spacer()
            
            //thumbnails for the selected category
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    if let array = vm.itemByCategory[selectedCategory] {
                        ForEach(array) { item in
                            ZStack(alignment: .topTrailing) {
                                // Thumbnail button
                                Button(action: {
                                    vm.selected(item)
                                }) {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFit() // makes it fill naturally
                                        .frame(width: 80, height: 80) // slightly bigger
                                        .cornerRadius(8)
                                        .background(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(vm.selected[selectedCategory]?.id == item.id ? .blue : .clear, lineWidth: 2)
                                            
                                        )
                                }
                                
                                // X remove button
                                Button(action: {
                                    vm.deselected(category: selectedCategory)
                                }) {
                                    Image(systemName: "xmark.square.fill")
                                        .foregroundColor(.red)
                                        .background(Color.white.opacity(0.7))
                                        .clipShape(Circle())
                                }
                                .offset(x: 5, y: -5)
                            }
                        }
                    } else {
                        Text("Not Available")
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.horizontal)
                
            }//scroll for thumbnails
            //Category selector
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 12){
                    ForEach(vm.gender.availableCategories, id: \.self){ cat in
                        Button(action: { selectedCategory = cat}) {
                            Text(cat.displayname)
                                .padding(12)
                                .background(cat == selectedCategory ? Color.yellow.opacity(1.9) : Color.gray.opacity(0.2))
                                .foregroundColor(.white)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .cornerRadius(8)
                        }
                    }
                }.padding(.horizontal)
            }//scroll ends
            
            Picker("キャラクター", selection: $vm.gender){
                Text("川口君").tag(CharacterType.male)
                Text("鈴木君").tag(CharacterType.female)
            }
            .pickerStyle(SegmentedPickerStyle.segmented)
            .onChange(of: vm.gender) { oldValue, newValue in
                vm.loadCharacterDresses(for: newValue)
                vm.loadCharacterSkin(for: newValue)
            }//picker ends
            
            //Export / share buttons
            HStack(spacing: 45) {
                Button{
                    let snapshotView = ZStack {
                       DiscoBackground()
                            .scaledToFill()
                            .ignoresSafeArea(edges: .all)

                        if let doll = vm.selected[.Bodies] {
                            Image(doll.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 600, height: 600)
                        }
                        if let doll_2 = vm.selected[.body] {
                            Image(doll_2.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500, height: 500)
                        }
                        ForEach(selectedItemsSorted(), id: \.id) { item in
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                        }
                    }//snapshot stack ends
                    
                    let size = CGSize(width:  1024, height: 1024)
                    let screenSize = UIScreen.main.bounds.size
                    let image = snapshotView.snapshot(size: size)
                    shareImage = image
                    if shareImage != nil {
                        showShare = true
                    }
                    // ✅ DEBUG PRINTS
                     print("📸 Snapshot taken: \(image.size.width)x\(image.size.height)")
                     print("📸 Image scale: \(image.scale)")
                }label:{
                    Image("share")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.white)
                        
                }
                .sheet(isPresented: $showShare) {
                    if let img = shareImage {
                        ShareSheet(activityItems: [img])
                    }
                }
                
                Button{
                    vm.selected.removeAll()
                    vm.loadCharacterSkin(for: .male)
                }label:{
                    Image("reset")
                        .resizable()
                        .frame(width: 75, height: 55)
                }
                
                Button{
                    soundToggle.toggle()
                    if(soundToggle == true){
                        AnimeMusic.shared.playMusic()
                    }else{
                        AnimeMusic.shared.stopMusic()
                    }
                }label: {
                    Text(soundToggle == true ? "🔈" : "🔇")
                        .font(.system(size: 50, weight: .bold, design: .default))
                }
                
                
            }//ends HStack
            .padding()
        }//first Vstack ends
        .background(DiscoBackground())
        
        
        .onAppear {
            AnimeMusic.shared.playMusic()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        
    }//body ends
    
    
    private func selectedItemsSorted() -> [DressDoll]{
        let arr = vm.selected.values.sorted { $0.layerOrder < $1.layerOrder}
        return arr
    }//selectedItems
}


#Preview {
    startView()
}
