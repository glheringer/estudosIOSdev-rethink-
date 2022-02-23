//
//  ViewController.swift
//  MinhasAnotacoes
//
//  Created by Rethink on 23/02/22.
//

import UIKit

class ViewController: UIViewController {
    let key = "textoSalvo"
    @IBOutlet weak var textoAnotacoes: UITextView!
    @IBAction func botaoSalvar(_ sender: Any) {
        if  let textoSalvo = textoAnotacoes.text{
            UserDefaults.standard.set(textoSalvo, forKey: key)
        }
    }
    func recuperarAnotacao() -> String{
        if let retorno = UserDefaults.standard.object(forKey: key){
        // Se recuperar alguma coisa, retornar
         return retorno as! String
        }
        return " "
        // Senao retorna vazio
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textoAnotacoes.text = recuperarAnotacao()
    }


}

