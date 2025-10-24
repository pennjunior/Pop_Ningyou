//
//  viewModel.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/03.
//

import SwiftUI
import Combine

final class DollViewModel: ObservableObject {
    //Handle images that are currently selected per category
    @Published var selected: [CategoryType: DressDoll] = [:]
    @Published var gender: CharacterType = .female
    @Published var itemByCategory: [CategoryType: [DressDoll]] = [:]
    
    init(){
        loadCharacterDresses(for: .male)
        loadCharacterSkin(for: .male)
    }
    
    func loadCharacterSkin(for gender: CharacterType){
        selected.removeAll()
        itemByCategory.removeAll()
        self.gender = gender
        switch gender {
        case .female:
            let bodies = [
                DressDoll(imageName: "Body", layerOrder: 1, category: .body),
            ]//body ends
            itemByCategory[.body] = bodies
            selected[.body] = bodies[0]
            
        case .male:
            let bodies = [
                DressDoll(imageName: "body-1_1", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_2", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_3", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_4", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_5", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_6", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_7", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_8", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_9", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_10", layerOrder: 1, category: .Bodies)
                
            ]
            itemByCategory[.Bodies] = bodies
            selected[.Bodies] = bodies[0]
            let underWears = [
                DressDoll(imageName: "underwear-1_1", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_2", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_3", layerOrder: 3, category: .Underwear)
            ]
            itemByCategory[.Underwear] = underWears
            selected[.Underwear] = underWears[0]
         }//switch closed
        loadCharacterDresses(for: gender)
    }//load skin ends
     
    func loadCharacterDresses(for gender: CharacterType) {
        
        self.gender = gender
        
        switch gender {
        case .female:
    
        itemByCategory[.background] = [
            DressDoll(imageName: "background 2", layerOrder: 0, category: .background),
            DressDoll(imageName: "background 3", layerOrder: 0, category: .background),
            DressDoll(imageName: "background 7", layerOrder: 0, category: .background)
        ]//backgroundoption end
        
    
        
        itemByCategory[.backHair] = [
            DressDoll(imageName: "curly_hair", layerOrder: 0, category: .hair),
            DressDoll(imageName: "short_hair", layerOrder: 0, category: .hair),
            DressDoll(imageName: "straight_hair", layerOrder: 0, category: .hair)
        ]//backHair end here
        
        itemByCategory[.dresses] = [
            DressDoll(imageName: "checkered_dress", layerOrder: 4, category: .dresses),
            DressDoll(imageName: "jean_dress", layerOrder: 4, category: .dresses),
            DressDoll(imageName: "off_shoulder dress", layerOrder: 4, category: .dresses),
            DressDoll(imageName: "overalls", layerOrder: 4, category: .dresses),
            DressDoll(imageName: "red_dress", layerOrder: 4, category: .dresses)
        ]//dresses options end here
        
        itemByCategory[.socks] = [
            DressDoll(imageName: "big_cozy_socks", layerOrder: 2, category: .socks),
            DressDoll(imageName: "black_socks", layerOrder: 2, category: .socks),
            DressDoll(imageName: "fishnets", layerOrder: 2, category: .socks),
            DressDoll(imageName: "pink_socks", layerOrder: 2, category: .socks),
            DressDoll(imageName: "striped_socks", layerOrder: 2, category: .socks),
            DressDoll(imageName: "white_socks", layerOrder: 2, category: .socks)
        ]//socks options ends
        
        itemByCategory[.hair] = [
            DressDoll(imageName: "curtain_bangs", layerOrder: 2, category: .hair),
            DressDoll(imageName: "hair_behind ears", layerOrder: 2, category: .hair),
            DressDoll(imageName: "side_bangs", layerOrder: 2, category: .hair),
            DressDoll(imageName: "straight_bangs", layerOrder: 2, category: .hair),
            DressDoll(imageName: "strands", layerOrder: 2, category: .hair),
        ]//hair options end
        
        itemByCategory[.pants] = [
            DressDoll(imageName: "black bell leggings", layerOrder: 5, category: .pants),
            DressDoll(imageName: "black skirt", layerOrder: 5, category: .pants),
            DressDoll(imageName: "green pants", layerOrder: 5, category: .pants),
            DressDoll(imageName: "pink pants", layerOrder: 5, category: .pants),
            DressDoll(imageName: "pink skirt", layerOrder: 5, category: .pants),
            DressDoll(imageName: "purple pants", layerOrder: 5, category: .pants),
            DressDoll(imageName: "star jeans", layerOrder: 5, category: .pants),
            DressDoll(imageName: "yellow skirt", layerOrder: 5, category: .pants)
        ]
        
        //items for Shirts
        itemByCategory[.shirts] = [
            DressDoll(imageName: "black top", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "collar and tee top", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "green tube top", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "heart cutout turtleneck", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "jersey crop top", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "small tank top", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "striped shirt", layerOrder: 6, category: .shirts),
            DressDoll(imageName: "white collar top", layerOrder: 6, category: .shirts)
        ]
        
        //items for shoes
        
        itemByCategory[.shoes] = [
            DressDoll(imageName: "black boots", layerOrder: 8, category: .shoes),
            DressDoll(imageName: "black buckle shoes", layerOrder: 8, category: .shoes),
            DressDoll(imageName: "pink platforms", layerOrder: 8, category: .shoes),
            DressDoll(imageName: "sneakers", layerOrder: 8, category: .shoes),
            DressDoll(imageName: "timberland boots", layerOrder: 8, category: .shoes)
        ]
        
        itemByCategory[.sweaters] = [
            DressDoll(imageName: "checkered_sweater", layerOrder: 8, category: .sweaters),
            DressDoll(imageName: "green_sweater", layerOrder: 8, category: .sweaters),
            DressDoll(imageName: "pink_sweater", layerOrder: 8, category: .sweaters),
            DressDoll(imageName: "sports_jacket", layerOrder: 8, category: .sweaters),
            DressDoll(imageName: "windbreaker", layerOrder: 8, category: .sweaters)
        ]//sweater option end
            
        case .male:
            itemByCategory[.background] = [
                DressDoll(imageName: "background 1", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 2", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 3", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 4", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 5", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 6", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 7", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 8", layerOrder: 0, category: .background),
                DressDoll(imageName: "background 9", layerOrder: 0, category: .background)
            ]//backgroundoption end
            itemByCategory[.Bodies] = [
                DressDoll(imageName: "body-1_1", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_2", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_3", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_4", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_5", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_6", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_7", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_8", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_9", layerOrder: 1, category: .Bodies),
                DressDoll(imageName: "body-1_10", layerOrder: 1, category: .Bodies)
                
            ]
            itemByCategory[.Underwear] = [
                DressDoll(imageName: "underwear-1_1", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_2", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_3", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_4", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_5", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_6", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_7", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_8", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_9", layerOrder: 3, category: .Underwear),
                DressDoll(imageName: "underwear-1_10", layerOrder: 3, category: .Underwear)
            ]
            itemByCategory[.Lips] = [
                DressDoll(imageName: "lips-1_1", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_2", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_3", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_4", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_5", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_6", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_7", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_8", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_9", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-1_10", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_1", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_2", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_3", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_4", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_5", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_6", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_7", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_8", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_9", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-2_10", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-3_1", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_2", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_3", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_4", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_5", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_6", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_7", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_8", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_9", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-4_10", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_1", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_2", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_3", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_4", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_5", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_6", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_7", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_8", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_9", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-5_10", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_1", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_2", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_3", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_4", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_5", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_6", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_7", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_8", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_9", layerOrder: 4, category: .Lips),
                DressDoll(imageName: "lips-6_10", layerOrder: 4, category: .Lips),
            ]
            itemByCategory[.Eyebrows] = [
                DressDoll(imageName: "eyebrows-1_1", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_2", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_3", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_4", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_5", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_6", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_7", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_8", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_9", layerOrder: 4, category: .Eyebrows),
                DressDoll(imageName: "eyebrows-1_10", layerOrder: 4, category: .Eyebrows)
            ]
            itemByCategory[.Eyes] = [
                DressDoll(imageName: "eyes-1_1_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_2_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_3_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_4_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_5_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_6_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_7_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_8_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_9_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_10_back", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_1_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_2_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_3_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_4_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_5_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_6_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_7_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_8_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_9_front", layerOrder: 5, category: .Eyes),
                DressDoll(imageName: "eyes-1_10_front", layerOrder: 5, category: .Eyes)
                ]
            itemByCategory[.Irises] = [
                DressDoll(imageName: "irises-1_1", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_2", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_3", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_4", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_5", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_6", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_7", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_8", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_9", layerOrder: 12, category: .Irises),
                DressDoll(imageName: "irises-1_10", layerOrder: 12, category: .Irises)
            ]
            itemByCategory[.Glasses] = [
                DressDoll(imageName: "glasses-1_1", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_2", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_3", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_4", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_5", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_6", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_7", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_8", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_9", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-1_10", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_1", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_2", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_3", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_4", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_5", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_6", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_7", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_8", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_9", layerOrder: 6, category: .Glasses),
                DressDoll(imageName: "glasses-2_10", layerOrder: 6, category: .Glasses)
                
            ]
            itemByCategory[.Gloves] = [
                DressDoll(imageName: "gloves-1_1", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_2", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_3", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_4", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_5", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_6", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_7", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_8", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_9", layerOrder: 19, category: .Gloves),
                DressDoll(imageName: "gloves-1_10", layerOrder: 19, category: .Gloves)
            ]
            itemByCategory[.Hair] = [
                DressDoll(imageName: "hair-1_1", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_2", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_3", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_4", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_5", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_6", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_7", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_8", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_9", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-1_10", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_1", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_2", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_3", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_4", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_5", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_6", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_7", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_8", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_9", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-2_10", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_1", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_2", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_3", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_4", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_5", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_6", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_7", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_8", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_9", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-3_10", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_1", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_2", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_3", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_4", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_5", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_6", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_7", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_8", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_9", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-4_10", layerOrder: 5, category: .Hair),
//                DressDoll(imageName: "hair-5_1", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_2", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_3", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_4", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_5", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_6", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_7", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_8", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_9", layerOrder: 5, category: .Hair),
                DressDoll(imageName: "hair-5_10", layerOrder: 5, category: .Hair),
            ]
            itemByCategory[.Hats] = [
                DressDoll(imageName: "hat-1_1", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_2", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_3", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_4", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_5", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_6", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_7", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_8", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_9", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-1_10", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_1", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_2", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_3", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_4", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_5", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_6", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_7", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_8", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_9", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-2_10", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_1", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_2", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_3", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_4", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_5", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_6", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_7", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_8", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_9", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-3_10", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_1_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_1_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_2_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_2_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_3_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_3_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_4_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_4_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_5_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_5_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_6_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_6_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_7_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_7_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_8_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_8_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_9_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_9_back", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_10_front", layerOrder: 17, category: .Hats),
                DressDoll(imageName: "hat-4_10_back", layerOrder: 17, category: .Hats)
            ]
            itemByCategory[.Shorts] = [
                DressDoll(imageName: "shorts-1_1", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_2", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_3", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_4", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_5", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_6", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_7", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_8", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_9", layerOrder: 11, category: .Shorts),
                DressDoll(imageName: "shorts-1_10", layerOrder: 11, category: .Shorts),
            ]
            itemByCategory[.ShoulderLeft] = [
                DressDoll(imageName: "shoulder_left-1_1", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_2", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_3", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_4", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_5", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_6", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_7", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_8", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_9", layerOrder: 14, category: .ShoulderLeft),
                DressDoll(imageName: "shoulder_left-1_10", layerOrder: 14, category: .ShoulderLeft)
            ]
            itemByCategory[.ShoulderRight] = [
                DressDoll(imageName: "shoulder_right-1_1", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_2", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_3", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_4", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_5", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_6", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_7", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_8", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_9", layerOrder: 15, category: .ShoulderRight),
                DressDoll(imageName: "shoulder_right-1_10", layerOrder: 15, category: .ShoulderRight)
            ]
            itemByCategory[.Socks] = [
                DressDoll(imageName: "socks-1_1", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_2", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_3", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_4", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_5", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_6", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_7", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_8", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_9", layerOrder: 9, category: .Socks),
                DressDoll(imageName: "socks-1_10", layerOrder: 9, category: .Socks),
            ]
            itemByCategory[.Swimsuits] = [
                DressDoll(imageName: "swimsuit-1_1", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_2", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_3", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_4", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_5", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_6", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_7", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_8", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_9", layerOrder: 23, category: .Swimsuits),
                DressDoll(imageName: "swimsuit-1_10", layerOrder: 23, category: .Swimsuits)
            ]
            itemByCategory[.Tops] = [
                DressDoll(imageName: "top-1_1", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_2", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_3", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_4", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_5", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_6", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_7", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_8", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_9", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-1_10", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_1", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_2", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_3", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_4", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_5", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_6", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_7", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_8", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_9", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-2_10", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_1", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_2", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_3", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_4", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_5", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_6", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_7", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_8", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_9", layerOrder: 13, category: .Tops),
                DressDoll(imageName: "top-3_10", layerOrder: 13, category: .Tops),
            ]
            itemByCategory[.Trousers] = [
                DressDoll(imageName: "trousers-1_1", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_2", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_3", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_4", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_5", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_6", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_7", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_8", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_9", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-1_10", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_1", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_2", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_3", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_4", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_5", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_6", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_7", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_8", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_9", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-2_10", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_1", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_2", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_3", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_4", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_5", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_6", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_7", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_8", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_9", layerOrder: 18, category: .Trousers),
                DressDoll(imageName: "trousers-3_10", layerOrder: 18, category: .Trousers),
            ]

            itemByCategory[.InHandLeft] = [
                DressDoll(imageName: "in_hand_left-1_1", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_2", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_3", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_4", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_5", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_6", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_7", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_8", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_9", layerOrder: 9, category: .InHandLeft),
                DressDoll(imageName: "in_hand_left-1_10", layerOrder: 9, category: .InHandLeft)
            ]
            itemByCategory[.InHandRight] = [
                DressDoll(imageName: "in_hand_right-1_1", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_2", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_3", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_4", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_5", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_6", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_7", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_8", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_9", layerOrder: 10, category: .InHandRight),
                DressDoll(imageName: "in_hand_right-1_10", layerOrder: 10, category: .InHandRight)
            ]
        
            itemByCategory[.Jackets] = [
                DressDoll(imageName: "jacket-1_1", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_2", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_3", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_4", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_5", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_6", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_7", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_8", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_9", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-1_10", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_1", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_2", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_3", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_4", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_5", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_6", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_7", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_8", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_9", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-2_10", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_1", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_2", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_3", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_4", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_5", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_6", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_7", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_8", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_9", layerOrder: 22, category: .Jackets),
                DressDoll(imageName: "jacket-3_10", layerOrder: 22, category: .Jackets),
            ]
            
            itemByCategory[.Bracelets] = [
                DressDoll(imageName: "bracelet-1_1", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_2", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_3", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_4", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_5", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_6", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_7", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_8", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_9", layerOrder: 24, category: .Bracelets),
                DressDoll(imageName: "bracelet-1_10", layerOrder: 24, category: .Bracelets)
            ]
            
            itemByCategory[.Coats] = [
                DressDoll(imageName: "coat-1_2", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_2", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_3", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_4", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_5", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_6", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_7", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_8", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_9", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-1_10", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_1", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_2", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_3", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_4", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_5", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_6", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_7", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_8", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_9", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-2_10", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_1", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_2", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_3", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_4", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_5", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_6", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_7", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_8", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_9", layerOrder: 21, category: .Coats),
                DressDoll(imageName: "coat-3_10", layerOrder: 21, category: .Coats),
            ]
            itemByCategory[.Necklaces] = [
                DressDoll(imageName: "necklace-1_1", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_2", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_3", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_4", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_5", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_6", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_7", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_8", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_9", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-1_10", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_1", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_2", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_3", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_4", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_5", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_6", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_7", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_8", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_9", layerOrder: 7, category: .Necklaces),
                DressDoll(imageName: "necklace-2_10", layerOrder: 7, category: .Necklaces),
            ]
            itemByCategory[.Backpacks] = [
                DressDoll(imageName: "backpack-1_1_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_1_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_2_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_2_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_3_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_3_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_4_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_4_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_5_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_5_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_6_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_6_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_7_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_7_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_8_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_8_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_9_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_9_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_10_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-1_10_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_1_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_1_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_2_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_2_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_3_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_3_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_4_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_4_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_5_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_5_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_6_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_6_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_7_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_7_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_8_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_8_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_9_front", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-2_9_back", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_1", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_2", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_3", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_4", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_5", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_6", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_7", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_8", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_9", layerOrder: 26, category: .Backpacks),
                DressDoll(imageName: "backpack-3_10", layerOrder: 26, category: .Backpacks)
                
            ]
            itemByCategory[.Belts] = [
                DressDoll(imageName: "belt-1_1", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_2", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_3", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_4", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_5", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_6", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_7", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_8", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_9", layerOrder: 20, category: .Belts),
                DressDoll(imageName: "belt-1_10", layerOrder: 20, category: .Belts)
                ]
            itemByCategory[.Scarves] = [
                DressDoll(imageName: "scarf-1_1", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_2", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_3", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_4", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_5", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_6", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_7", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_8", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_9", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-1_10", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_1", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_2", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_3", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_4", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_5", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_6", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_7", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_8", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_9", layerOrder: 16, category: .Scarves),
                DressDoll(imageName: "scarf-2_10", layerOrder: 16, category: .Scarves),
            ]
            itemByCategory[.Shoes] = [
                DressDoll(imageName: "shoes-1_1", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_2", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_3", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_4", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_5", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_6", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_7", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_8", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_9", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-1_10", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_1", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_2", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_3", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_4", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_5", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_6", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_7", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_8", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_9", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-2_10", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_1", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_2", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_3", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_4", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_5", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_6", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_7", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_8", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_9", layerOrder: 8, category: .Shoes),
                DressDoll(imageName: "shoes-3_10", layerOrder: 8, category: .Shoes),
            ]
           
            
            
            
            
        }//switch ends
    }//load character func ends
    
    
    
    
    func selected(_ item :DressDoll){
        selected[item.category] = item
    }
    func deselected(category: CategoryType) {
        selected[category] = nil
    }
    
    func revertAll(_ item :DressDoll){
        selected[item.category] = nil
    }
    
    
}
