//
//  DetalheFilmes.swift
//  MeusFilmes
//
//  Created by Rethink on 22/02/22.
//

import UIKit

class DetalheFilmes: UIViewController {

    var filme : Filme!
    
    @IBOutlet weak var imageViewDetalhes: UIImageView!
    @IBOutlet weak var tituloDetalhes: UILabel!
    @IBOutlet weak var descricaoDetalhes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewDetalhes.image = filme.imagem
        tituloDetalhes.text = filme.titulo
        descricaoDetalhes.text = filme.descricao
    
    }
    

}
