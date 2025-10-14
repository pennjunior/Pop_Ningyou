//
//  modell.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/03.
//

import Foundation
//lets define all the dress-up categories and assets
enum CharacterType: String, CaseIterable, Identifiable, Hashable {
    case male
    case female
    var id: String { rawValue}
    
    var availableCategories: [CategoryType] {
        switch self {
        case .female:
            return [ .background, .body, .socks, .backHair, .hair, .dresses, .pants, .shirts, .sweaters, .shoes]
        case .male:
            return [ .background, .Backpacks, .Belts, .Bodies, .Bracelets, .Coats, .Eyebrows, .Eyes, .Glasses, .Gloves, .Hair, .Hats, .InHandLeft, .InHandRight, .Irises, .Jackets, .Lips, .Necklaces, .Scarves, .Shoes, .Shorts, .ShoulderLeft, .ShoulderRight, .Socks, .Swimsuits, .Tops, .Trousers, .Underwear]
        }
    }
}

enum DressLayer: Int, CaseIterable {
    case background, body, socks, backHair, hair, dresses, pants, shirts, sweaters, shoes, Backpacks, Belts, Bodies, Bracelets, Coats, Eyebrows, Eyes, Glasses, Gloves, Hair, Hats, InHandLeft, InHandRight, Irises, Jackets, Lips, Necklaces, Scarves, Shoes, Shorts, ShoulderLeft, ShoulderRight, Socks, Swimsuits, Tops, Trousers, Underwear
    
    static var renderOrder: [DressLayer] {
        return [.background, .body, .backHair, .hair, .socks, .dresses, .sweaters]
    }
}

enum CategoryType: String, CaseIterable, Identifiable {
    case background, body, socks, backHair, hair, dresses, pants, shirts, sweaters, shoes, Backpacks, Belts, Bodies, Bracelets, Coats, Eyebrows, Eyes, Glasses, Gloves, Hair, Hats, InHandLeft, InHandRight, Irises, Jackets, Lips, Necklaces, Scarves, Shoes, Shorts, ShoulderLeft, ShoulderRight, Socks, Swimsuits, Tops, Trousers, Underwear
    
    var id: String {rawValue}
    var displayname: String {
        switch self {
        case .background: return "背景"
        case .body: return "キャラクター"
        case .socks: return "靴下"
        case .backHair: return "背髪"
        case .hair: return "髪型"
        case .sweaters: return "セーター"
        case .dresses: return "ドレス"
        case .pants: return "ズボン"
        case .shirts: return "シャツ"
        case .shoes: return "靴"
            //males displays
        case .Bodies: return "体"
        case .Lips: return "唇"
        case .Irises: return "虹彩"
        case .Eyebrows: return "眉毛"
        case .Eyes: return "目"
        case .Glasses: return "メガネ"
        case .Hair: return "髪型"
        case .Hats: return "帽子"
        case .Gloves: return "手袋"
        case .Socks: return "靴下"
        case .Swimsuits: return "水着"
        case .Tops: return "トップス"
        case .Trousers: return "ズボン"
        case .Underwear: return "下着"
        case .Bracelets: return "ブレスレット"
        case .Coats: return "コート"
        case .Belts: return "ベルト"
        case .InHandLeft: return "左手のアイテム"
        case .InHandRight: return "右手のアイテム"
        case .Jackets: return "ジャケット"
        case .Necklaces: return "ネックレス"
        case .Scarves: return "スカーフ"
        case .Shoes: return "靴"
        case .Shorts: return "ショートパンツ"
        case .ShoulderLeft: return "左肩のアイテム"
        case .ShoulderRight: return "右肩のアイテム"
        case .Backpacks: return "カバン"
        }
    }
    
    var layerOrder: Int {
        switch self {
        case .background: return 0
        case .body: return 1
        case .backHair: return 2
        case .socks: return 4
        case .shoes: return 8
        case .hair: return 3
        case .sweaters: return 4
        case .dresses: return 5
        case .pants: return 6
        case .shirts: return 7
        case .Backpacks: return 26
        case .Belts: return 20
        case .Bodies: return 1
        case .Bracelets: return 24
        case .Coats: return 21
        case .Eyebrows: return 4
        case .Eyes: return 5
        case .Glasses: return 6
        case .Gloves: return 19
        case .Hair: return 5
        case .Hats: return 17
        case .InHandLeft: return 9
        case .InHandRight: return 10
        case .Irises: return 12
        case .Jackets: return 22
        case .Lips: return 4
        case .Necklaces: return 7
        case .Scarves: return 16
        case .Shoes: return 8
        case .Shorts: return 11
        case .ShoulderLeft: return 14
        case .ShoulderRight: return 15
        case .Socks: return 9
        case .Swimsuits: return 23
        case .Tops: return 13
        case .Trousers: return 18
        case .Underwear: return 13
            
        }
    }
}//enum ends



//model for single item
struct DressDoll: Identifiable {
    let id = UUID()
    let imageName: String
    let layerOrder: Int
    let category: CategoryType
}

//saved or track selected items by user
struct SavedItemsModel: Identifiable {
    let id = UUID()
    var selectedItems: [DressDoll] = []
}
