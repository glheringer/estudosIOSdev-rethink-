//
//  ViewController.swift
//  CaraOuCoroa
//
//  Created by Rethink on 21/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "sortearMoeda"){
            let vcDestino = segue.destination as! ResultadoViewController
            vcDestino.numeroRandomico = Int(arc4random_uniform(2))
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

