//
//  DetalhesViewController.swift
//  PassarDadosEntreTelas
//
//  Created by Rethink on 17/02/22.
//

import UIKit

class DetalhesViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    var textoRecebido: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultadoLegenda.text = textoRecebido
        // Do any additional setup after loading the view.
    }

}
