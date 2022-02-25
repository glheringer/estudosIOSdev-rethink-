//
//  TarefasViewController.swift
//  ListaDeTarefas
//
//  Created by Rethink on 24/02/22.
//

import UIKit

class TarefasViewController: UIViewController {

    @IBOutlet weak var tarefasCampo: UITextField!
    @IBAction func salvarTarefas(_ sender: Any) {
        if let textoDigitado =  tarefasCampo.text{
            let tarefaDefaults = TarefasUserDefaults()
            tarefaDefaults.salvar(tarefa: textoDigitado)
            
//            let listaTarefas = tarefaDefaults.listar()
//            print (listaTarefas)
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
