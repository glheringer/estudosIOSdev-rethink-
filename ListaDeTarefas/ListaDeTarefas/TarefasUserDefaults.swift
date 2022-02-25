//
//  TarefasUserDefaults.swift
//  ListaDeTarefas
//
//  Created by Rethink on 24/02/22.
//

import UIKit

class TarefasUserDefaults{
    let chave = "listaTarefas"
    var tarefas: [String] = []
        
    func salvar(tarefa: String){
        tarefas = self.listar()
        tarefas.append(tarefa)
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    func listar () -> Array<String>{
        let tarefasFeitas = UserDefaults.standard.object(forKey: chave)
        
        if tarefasFeitas != nil{
            return tarefasFeitas as! Array<String>
        }
        else{
            return []
        }
    }
    func remover(indice: Int)  {
        tarefas =  self.listar()
        tarefas.remove(at: indice)
        UserDefaults.standard.set(tarefas, forKey: chave)
        
        
    }
}

