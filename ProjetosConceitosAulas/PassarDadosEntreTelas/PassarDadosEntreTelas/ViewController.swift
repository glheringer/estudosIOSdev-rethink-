//
//  ViewController.swift
//  PassarDadosEntreTelas
//
//  Created by Rethink on 17/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nomeCampo: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarDados"{
            let vcDestino = segue.destination as! DetalhesViewController
            vcDestino.textoRecebido = nomeCampo.text!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

