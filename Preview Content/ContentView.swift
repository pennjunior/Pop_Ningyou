//
//  ContentView.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = DollViewModel()
    @State private var shareImage: UIImage? = nil
    @State private var showShare = false
    @State private var selectedCategory: CategoryType = .hair
    @State private var animate = false
    
    var body: some View {
        //doll display
        VStack(spacing: 10){
                Picker("キャラクター", selection: $vm.gender){
                    Text("川口君").tag(CharacterType.male)
                    Text("鈴木君").tag(CharacterType.female)
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: vm.gender) { gender in
                    vm.loadCharacterDresses(for: gender)
                    vm.loadCharacterSkin(for: gender)
                }//picker stack
            
             //Doll display
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
                
            
            //Category selector
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 12){
                    ForEach(vm.gender.availableCategories, id: \.self){ cat in
                        Button(action: { selectedCategory = cat}) {
                            Text(cat.displayname)
                                .padding(8)
                                .background(cat == selectedCategory ? Color.yellow.opacity(1.9) : Color.gray.opacity(0.2))
                                .foregroundColor(.primary)
                                .cornerRadius(8)
                        }
                    }
                }.padding(.horizontal)
            }//scroll ends
            
            
            //thumbnails for the selected category
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5){
                    if let array = vm.itemByCategory[selectedCategory] {
                        ForEach(array) { item  in
//                            VStack {
                                Button(action: {
                                    vm.selected(item)
                                })
                                {
                                    //selecting thumbnails starts
                                    Image(item.imageName)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(vm.selected[selectedCategory]?.id == item.id ? Color.yellow : Color.gray, lineWidth: 2)
                                        )
                                    //selecting thumbnails end
                                }
                                Button("X")
                                {
                                    vm.deselected(category: selectedCategory)
                                }
                                .font(.title)
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .background(Color.red)
                                .cornerRadius(100)
                                
//                            }
                            
                        }//each v stack
                    }//if statement end
                    else {
                        Text("Not Available")
                     
                
                    } //else ends
                }//Hstack ends
            
            }//scroll for thumbnails
            //        .padding()
            
        }//frist Vstack ends
        .background(DiscoBackground())
        .onAppear {
            AnimeMusic.shared.stopMusic()
        }

//                Export / share buttons
                HStack {
                    Button("SAVE") {
                        let snapshotView = ZStack {
                            if let bg = vm.selected[.background]
                            { Image(bg.imageName).resizable().scaledToFit() }
                            if let doll = vm.selected[.Bodies] {
                                Image(doll.imageName).resizable().scaledToFit()
                            }
                            if let doll_2 = vm.selected[.body] {
                                Image(doll_2.imageName).resizable().scaledToFit()
                            }
                            ForEach(selectedItemsSorted(), id: \.id){ item in
                                Image(item.imageName).resizable().scaledToFit()
                            }
                        }
        
                        let size = CGSize(width: 1024, height: 1024)
                        shareImage = snapshotView.snapshot(size: size)
                        if let img = shareImage {
                            showShare = true
                        }
                    }
                    .padding(.horizontal)
        
                    Button("RESET"){
                 
                
                    }
                    .padding(.horizontal)
                }//ends HStack
    }//picker stack
    private func selectedItemsSorted() -> [DressDoll]{
        let arr = vm.selected.values.sorted { $0.layerOrder < $1.layerOrder}
        return arr
    }//selectedItems
}//body ends


#Preview {
    ContentView()
}
