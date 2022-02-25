//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by Rethink on 24/02/22.
//

import UIKit

class TableViewController: UITableViewController {
    var tarefas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.atualizarListaTarefas()
    }
    
    func atualizarListaTarefas() {
        let tarefaDefaults = TarefasUserDefaults()
        tarefas = tarefaDefaults.listar()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let tarefa = TarefasUserDefaults()
            tarefa.remover(indice: indexPath.row)
            self.atualizarListaTarefas()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath)
        celula.textLabel?.text = tarefas[indexPath.row]
        return celula
    }
}

