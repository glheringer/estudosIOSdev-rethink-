//
//  ViewController.swift
//  Gerador Numeros
//
//  Created by Rethink on 10/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var legendaResultado: UILabel!
    @IBAction func gerarNumero(_ sender: Any) {
        let numero = arc4random_uniform(21)
        legendaResultado.text = String(numero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

