//
//  ViewController.swift
//  Signos
//
//  Created by Rethink on 21/02/22.
//

import UIKit

class ViewController: UITableViewController {

    var signos : [String] = []
    var significadoSignos : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //colocando valores no vetor de signos
        signos.append("Áries")
        signos.append("Touro")
        signos.append("Gêmeos")
        signos.append("Câncer")
        signos.append("Leão")
        signos.append("Virgem")
        signos.append("Libra")
        signos.append("Escorpião")
        signos.append("Sagitário")
        signos.append("Capricórnio")
        signos.append("Aquário")
        signos.append("Peixes")
        
        //colocando valores no vetor de signficado
        significadoSignos.append("Arianos estão sempre em busca do máximo de prazer e não gostam de repetição. Movidos pela inquietação, não aguentam indecisões por muito tempo")
        significadoSignos.append("Taurinos amam conforto e sabem o que é bom nessa vida. Também são amigos fiéis e conseguem ser calmos e pragmáticos em momentos críticos")
        significadoSignos.append("2 - ... ")
        significadoSignos.append("3 - ... ")
        significadoSignos.append("4 - ... ")
        significadoSignos.append("5 - ... ")
        significadoSignos.append("6 - ... ")
        significadoSignos.append("7 - ... ")
        significadoSignos.append("8 - ... ")
        significadoSignos.append("9 - ... ")
        significadoSignos.append("10 - ... ")
        significadoSignos.append("11 - ... ")
        significadoSignos.append("12 - ... ")
        

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return signos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = signos [indexPath.row]
        return celula
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertaController = UIAlertController(title: "Significado Signo", message: significadoSignos[indexPath.row], preferredStyle: .alert)
        let confirmar = UIAlertAction(title: "Ok!", style: .default, handler: nil)
        alertaController.addAction(confirmar)
        present(alertaController, animated: true, completion: nil)
    }
    
}

