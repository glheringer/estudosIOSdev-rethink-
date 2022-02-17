//
//  ViewController.swift
//  FraseDoDia
//
//  Created by Rethink on 14/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var legendaResultado: UILabel!
    @IBAction func novaFrase(_ sender: Any) {
        var frases : [String]  = []
        
        frases.append("O ontem é história, o amanhã é um mistério, mas hoje é um dádiva, por isso chama-se presente")
        frases.append("Não precisa ser perfeito, apenas feito.")
        frases.append("E conhecerão a verdade, e a verdade os libertará.")
        
        let numeroAleatorio = Int(arc4random_uniform(3))
        legendaResultado.text = frases[numeroAleatorio]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

