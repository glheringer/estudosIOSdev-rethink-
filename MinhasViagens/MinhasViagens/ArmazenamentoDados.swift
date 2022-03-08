//
//  ArmazenamentoDados.swift
//  MinhasViagens
//
//  Created by Rethink on 07/03/22.
//

import UIKit

class ArmazenamentoDados{
    let key = "locaisViagem"
    var viagens : [Dictionary<String,String>] = []
    func getDefaults() -> UserDefaults { // funcao apenas para facilitar codigo
      return  UserDefaults.standard
    }
    
    func salvarViagem(viagem: Dictionary <String,String>) {
        viagens = self.listarViagens() //recupera o array atualizado
        
        viagens.append(viagem)
        getDefaults().set(viagens, forKey: key)
    }
    func listarViagens() -> [Dictionary<String,String>] {
        let viagensRecuperadas = getDefaults().object(forKey: key)
        if viagensRecuperadas != nil {
            return viagensRecuperadas as! Array
        }
        else{
            return []
        }
    }
    func excluirViagem()  {
    
    }
}
