//
//  ViewController.swift
//  PlayerSom
//
//  Created by Rethink on 21/03/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer () //controlador de audio
    
    @IBOutlet weak var sliderVolume: UISlider!
    @IBAction func updateVolume(_ sender: Any) {
        print(sliderVolume.value)
        player.volume = sliderVolume.value //Volume varia numa escala de 0 a 1 , meu slider tambem esta configurado para variar na mesma escala, mas pode ser personalizado.
        
    }
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3") { //se usa o Objeto especial de audio Bundle
            
            let url = URL(fileURLWithPath: path) // pede um caminho de URL
            do {
                player =  try AVAudioPlayer(contentsOf: url) //funcão para executar um audio, pede url
               
                player.prepareToPlay()
                
               
            } catch  {
                print("Erro ao executar som")
            }
            
            
        }
      
        
    }


}

