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
    @State private var shareURL: URL?
    @State private var showShare: Bool = false
    @State private var soundToggle: Bool = true
    @State private var isPreparingShare = false
    
    var body: some View {
        //doll display
        VStack(spacing: 2){
            //Doll display
            Spacer()
            ZStack{
                ForEach(selectedItemsSorted(), id: \.id) { item in
                    if vm.gender == .male {
                        CompressedImage(item.imageName, maxDimension: 600)  // ✅ Compressed
                            .scaledToFit()
                            .frame(width: 650, height: 650)
                    } else {
                        CompressedImage(item.imageName, maxDimension: 400)  // ✅ Compressed
                            .scaledToFit()
                            .frame(width: 450, height: 450)
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.4)
            .frame(maxWidth: .infinity)
            Spacer()

            
            //thumbnails for the selected category
            ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            if let array = vm.itemByCategory[selectedCategory] {
                               
                                ForEach(array) { item in
                                    ZStack(alignment: .topTrailing) {
                                        Button(action: {
                                            vm.selected(item)
                                        }) {
                                            CompressedImage(item.imageName, maxDimension: 200)  // ✅ Small for thumbnails
                                                .frame(width: thumbnailSize(for: selectedCategory),
                                                       height: thumbnailSize(for: selectedCategory))
//                                                .scaleEffect(scale)
                                                .clipped()
                                                .background(Color.white)
                                                .cornerRadius(8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(vm.selected[selectedCategory]?.id == item.id ? Color.orange : Color.clear, lineWidth: 3)
                                                )
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                        
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
                                .padding(16)
                                .background(cat == selectedCategory ? Color.orange.opacity(1.9) : Color.gray.opacity(0.2))
                                .foregroundColor(.white)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .cornerRadius(8)
                        }
                    }
                }.padding(.horizontal)
            }//scroll ends
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didReceiveMemoryWarningNotification)) { _ in
                    ImageCache.shared.clearCache()  // ✅ Clear cache on memory warning
                }
            Picker("キャラクター", selection: $vm.gender){
                Text("川口君").tag(CharacterType.male)
                Text("鈴木君").tag(CharacterType.female)
            }
            .pickerStyle(SegmentedPickerStyle.segmented)
            .onChange(of: vm.gender) { value in
                vm.loadCharacterDresses(for: value)
                vm.loadCharacterSkin(for: value)
            }//picker ends
            
            //Export / share buttons
            HStack(spacing: 45) {
                Button {
                    // Don't do anything if already preparing
                    guard !isPreparingShare else { return }
                    
                    isPreparingShare = true
                    
                    // Move EVERYTHING to background thread
                    DispatchQueue.global(qos: .userInitiated).async {
                        // 1) Build the snapshot view
                        let size = CGSize(width: 1024, height: 1024)
                        
                        // Get sorted items on background thread
                        let sortedItems = self.selectedItemsSorted()
                        
                        // 2) Create the snapshot on main thread (required for SwiftUI rendering)
                        var capturedImage: UIImage?
                        DispatchQueue.main.sync {
                            let snapshotView = ZStack {
                                DiscoBackground()
                                    .scaledToFill()
                                    .frame(width: size.width, height: size.height)
                                    .clipped()
                                
                                ForEach(sortedItems, id: \.id) { item in
                                    CompressedImage(item.imageName, maxDimension: 900)
                                        .scaledToFit()
                                        .frame(width: 900, height: 900)
                                        .position(x: size.width/2, y: size.height/2)
                                }
                            }
                            .frame(width: size.width, height: size.height)
                            
                            capturedImage = snapshotView.snapshot(size: size)
                        }
                        
                        guard let image = capturedImage else {
                            DispatchQueue.main.async {
                                self.isPreparingShare = false
                                print("Failed to create snapshot")
                            }
                            return
                        }
                        
                        // 3) Convert to PNG data
                        guard let data = image.pngData() else {
                            DispatchQueue.main.async {
                                self.isPreparingShare = false
                                print("Failed to create PNG data")
                            }
                            return
                        }
                        
                        // 4) Write to file
                        let  timeInterval = Int(Date().timeIntervalSince1970)
                        let tmpURL = FileManager.default.temporaryDirectory
                            .appendingPathComponent("DollSnapshot\(timeInterval).png")
                        
                        do {
                            if FileManager.default.fileExists(atPath: tmpURL.path) {
                                try FileManager.default.removeItem(at: tmpURL)
                            }
                            try data.write(to: tmpURL, options: .atomic)
                            
                            // 5) Update UI on main thread - ALL AT ONCE
                            DispatchQueue.main.async {
                                self.shareImage = image
                                self.shareURL = tmpURL
                                self.isPreparingShare = false
                                
                                // Add a tiny delay to ensure state is propagated
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                    self.showShare = true
                                }
                            }
                        } catch {
                            DispatchQueue.main.async {
                                self.isPreparingShare = false
                                print("Failed to write temp image: \(error)")
                            }
                        }
                    }
                } label: {
                    ZStack {
                        Image("share")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .opacity(isPreparingShare ? 0.3 : 1.0)
                        
                        if isPreparingShare {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(0.8)
                        }
                    }
                }
                .disabled(isPreparingShare)
                .sheet(isPresented: $showShare) {
                    // Make sure we always have something to show
                    if let url = shareURL, FileManager.default.fileExists(atPath: url.path) {
                        ShareSheet(activityItems: [url])
                    } else if let img = shareImage {
                        ShareSheet(activityItems: [img])
                    } else {
                        VStack {
                            ProgressView()
                            Text("Preparing image...")
                                .padding()
                        }
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
