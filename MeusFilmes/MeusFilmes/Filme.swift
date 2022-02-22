//
//  Filme.swift
//  MeusFilmes
//
//  Created by Rethink on 22/02/22.
//

import UIKit

class Filme{
    var titulo : String!
    var descricao : String!
    var imagem: UIImage!
    
    init(titulo:String, descricao:String, imagem:UIImage){
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
    }
}
