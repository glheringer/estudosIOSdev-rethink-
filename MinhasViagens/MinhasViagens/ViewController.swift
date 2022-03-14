//
//  ViewController.swift
//  MinhasViagens
//
//  Created by Rethink on 04/03/22.
//

import UIKit
import CoreLocation

class ViewController: UITableViewController {
    
    var viagens: [ Dictionary<String,String> ]  = []
    var controleNavegacao = "adicionar"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        controleNavegacao = "adicionar"
        atualizarDados()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viagens.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viagem = viagens[ indexPath.row ]["local"]
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath )
        celula.textLabel?.text = viagem
        
        
        return celula
    }
    //remover dados da tabela
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let tarefa = ArmazenamentoDados()
            tarefa.removerViagem(indice: indexPath.row)
            self.atualizarDados()

        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "verLocal", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verLocal" {
            
            let viewControllerDestino = segue.destination as! MapaViewController
            
            if self.controleNavegacao == "listar" {
                
                if let indiceRecuperado = sender {
                    
                    let indice = indiceRecuperado as! Int
                    viewControllerDestino.viagem = viagens[ indice ]
                    viewControllerDestino.indiceSelecionado = indice
                    
                }
                
            }
            else{
                viewControllerDestino.viagem = [:]
                viewControllerDestino.indiceSelecionado = -1
            }
        }
    }
    func atualizarDados(){
        self.viagens = ArmazenamentoDados().listarViagens()
        tableView.reloadData()
    }
}

