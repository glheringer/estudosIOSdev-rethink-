//
//  ViewController.swift
//  SomDosBichos
//
//  Created by Rethink on 21/03/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer () //controlador de audio
    
    @IBAction func dog(_ sender: Any) {
        self.playSong(name: "cao")
    }
    @IBAction func cat(_ sender: Any) {
        self.playSong(name: "gato")
    }
    @IBAction func lion(_ sender: Any) {
        self.playSong(name: "leao")
    }
    @IBAction func monkey(_ sender: Any) {
        self.playSong(name: "macaco")
    }
    @IBAction func sheep(_ sender: Any) {
        self.playSong(name: "ovelha")
    }
    @IBAction func cow(_ sender: Any) {
        self.playSong(name: "vaca")
    }
    func playSong (name : String){
        
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") { //se usa o Objeto especial de audio Bundle
            
            let url = URL(fileURLWithPath: path) // pede um caminho de URL
            do {
                player =  try AVAudioPlayer(contentsOf: url) //funcão para executar um audio, pede url
               
                player.prepareToPlay()
                
                player.play()
                
               
            } catch  {
                print("Erro ao executar som")
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

