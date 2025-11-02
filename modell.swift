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
            return [ .body, .hair,.backHair, .socks, .shirts, .dresses, .pants,  .sweaters, .shoes]
        case .male:
            return [ .Bodies, .Underwear, .Lips, .Irises,.Eyebrows, .Eyes, .Hair, .Hats, .Socks, .Trousers, .Tops, .Swimsuits, .Bracelets, .Coats, .Jackets, .Glasses, .Gloves, .InHandLeft, .InHandRight, .Necklaces, .Scarves,.Backpacks, .Belts, .Shoes, .Shorts, .ShoulderLeft, .ShoulderRight,    ]
        }
    }
}

enum CategoryType: String, CaseIterable, Identifiable {
    case body, Eyes, Lips, Irises, Hair, Underwear, socks, backHair, hair, dresses, pants, Swimsuits, shirts, sweaters, shoes, Shoes, Socks, Hats, Backpacks, Belts, Bodies, Bracelets, Coats, Eyebrows,  Glasses, Gloves,  InHandLeft, InHandRight,  Jackets, Necklaces, Scarves,  Shorts, ShoulderLeft, ShoulderRight,  Tops, Trousers
    
    var id: String {rawValue}
    var displayname: String {
        switch self {
        
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
        case .body: return 1
        case .backHair: return 0
        case .socks: return 2
        case .shoes: return 8
        case .hair: return 2
        case .sweaters: return 4
        case .dresses: return 5
        case .pants: return 6
        case .shirts: return 7
        case .Backpacks: return 11
        case .Belts: return 5
        case .Bodies: return 1
        case .Bracelets: return 2
        case .Coats: return 11
        case .Eyebrows: return 4
        case .Eyes: return 5
        case .Glasses: return 6
        case .Gloves: return 2
        case .Hair: return 5
        case .Hats: return 6
        case .InHandLeft: return 9
        case .InHandRight: return 10
        case .Irises: return 5
        case .Jackets: return 10
        case .Lips: return 4
        case .Necklaces: return 7
        case .Scarves: return 10
        case .Shoes: return 8
        case .Shorts: return 8
        case .ShoulderLeft: return 8
        case .ShoulderRight: return 8
        case .Socks: return 2
        case .Swimsuits: return 3
        case .Tops: return 6
        case .Trousers: return 9
        case .Underwear: return 3
            
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
