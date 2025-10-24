//
//  anime_music.swift
//  Pop_Ningyou
//
//  Created by cmAirS043 on 2025/10/11.
//

import Foundation
import AVFoundation

@Observable
class AnimeMusic {
    static let shared = AnimeMusic()
    var audioPlayer: AVAudioPlayer?
    var isPlaying = false
    init(){
        if let sound = Bundle.main.path(forResource: "j-rock-anime-rock-1-379253", ofType: "mp3"){
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.volume = 1.1
                audioPlayer?.play()
            }catch{
                print("AudioPlayer Error\(error.localizedDescription)")
            }
        }else{
                print("Sounds count not be found")
            }//if ends
        }////init ends
    func playMusic(){
        audioPlayer?.play()
    }
    
    func stopMusic(){
        audioPlayer?.stop()
    }
}
    

