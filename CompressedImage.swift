//
//  CompressedImage.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/28.
//

import SwiftUI
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.countLimit = 50 // Adjust based on your needs
        cache.totalCostLimit = 50 * 1024 * 1024 // 50MB
    }
    
    func getCompressedImage(named: String, maxDimension: CGFloat = 800) -> UIImage? {
        let cacheKey = "\(named)_\(Int(maxDimension))" as NSString
        
        // Check cache first
        if let cached = cache.object(forKey: cacheKey) {
            return cached
        }
        
        // Load and compress
        guard let original = UIImage(named: named),
              let compressed = original.compressedToFit(maxDimension: maxDimension) else {
            return nil
        }
        
        // Store in cache
        cache.setObject(compressed, forKey: cacheKey)
        return compressed
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}

// Extension for easy SwiftUI use
extension UIImage {
    func compressedToFit(maxDimension: CGFloat) -> UIImage? {
        let size = self.size
        
        var newSize: CGSize
        if size.width > size.height {
            let ratio = maxDimension / size.width
            newSize = CGSize(width: maxDimension, height: size.height * ratio)
        } else {
            let ratio = maxDimension / size.height
            newSize = CGSize(width: size.width * ratio, height: maxDimension)
        }
        
        if newSize.width >= size.width && newSize.height >= size.height {
            return self
        }
        
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}

struct CompressedImage: View {
    let imageName: String
    let maxDimension: CGFloat
    
    init(_ imageName: String, maxDimension: CGFloat = 800) {
        self.imageName = imageName
        self.maxDimension = maxDimension
    }
    
    var body: some View {
        if let uiImage = ImageCache.shared.getCompressedImage(named: imageName, maxDimension: maxDimension) {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image(imageName)
                .resizable()
        }
    }
}
