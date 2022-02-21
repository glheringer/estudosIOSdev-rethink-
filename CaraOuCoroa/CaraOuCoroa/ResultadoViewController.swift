//
//  ViewController.swift
//  CaraOuCoroa
//
//  Created by Rethink on 21/02/22.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    var numeroRandomico : Int!

    @IBOutlet weak var resultadoImagem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (numeroRandomico == 0){
            let imagem = UIImage(named: "moeda_cara")
            resultadoImagem.image = imagem
        }
        else{
            let imagem = UIImage(named: "moeda_coroa")
            resultadoImagem.image = imagem
        }
    }

}

