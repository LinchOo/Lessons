//
//  PlayerViewModel.swift
//  SliderObservablePublished
//
//  Created by Олег Коваленко on 23.01.2023.
//

import Foundation
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play(nameSong: String){
        playSong(name: nameSong)
        player?.play()
    }
    public func stop(){
        player?.stop()
    }
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        //player?.play()
    }
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
}






