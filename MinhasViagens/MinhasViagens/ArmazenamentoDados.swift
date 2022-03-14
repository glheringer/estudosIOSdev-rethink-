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
        getDefaults().synchronize()
    }
    func listarViagens() -> [Dictionary<String,String>] {
        
        let dados = getDefaults().object(forKey: key)
        if dados != nil {
            return dados as! Array
        }else{
            return []
        }
    }
    func removerViagem(indice: Int)  {
        
        viagens = self.listarViagens()
        viagens.remove(at: indice)
        
        getDefaults().set(viagens, forKey: key)
        getDefaults().synchronize()
    }
}
