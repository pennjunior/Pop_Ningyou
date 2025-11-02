//
//  thumbnail_sized.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/28.
//
import SwiftUI

func thumbnailSize(for category: CategoryType) -> CGFloat {
    switch category {
    case .Bracelets, .Eyebrows, .Eyes, .Glasses, .Gloves, .Hair, .Hats, .InHandLeft, .InHandRight, .Irises, .Lips, .Necklaces, .Shorts, .ShoulderLeft, .ShoulderRight, .Swimsuits, .Underwear:
        return 120
    case .body, .hair,.backHair, .socks, .shirts, .dresses, .pants,  .sweaters, .shoes:
        return 100
    default:
        return 110
    }
}
struct ThumbnailButton: View {
    let item: DressDoll
    let isSelected: Bool
    let onSelect: () -> Void
    
    @State private var showPreview = false
    
    var body: some View {
        ZStack {
            Button(action: {
                showPreview.toggle()
            }) {
                CompressedImage(item.imageName, maxDimension: 200)
                    .scaledToFit()
                    .frame(width: thumbnailSize(for: item.category),
                           height: thumbnailSize(for: item.category))
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                    )
            }
            .buttonStyle(.plain)
        }
        .sheet(isPresented: $showPreview) {
            ZStack {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()

                VStack {
                    ZStack {
                        CompressedImage(item.imageName, maxDimension: 1000)
                           
                            .scaledToFill()
                            .scaleEffect(2.7)
                            .frame(width: 500, height: 400)
                            .clipped() // 👈 this ensures zoom stays inside the frame
                            .cornerRadius(16)
                            .shadow(radius: 10)
                    }
                    .frame(width: 500, height: 400)
                    .clipped() // 👈 also clip the container in case of animation overflow

                    Button("Select") {
                        onSelect()
                        showPreview = false
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 20)
                }

            }
        }
    }
}


