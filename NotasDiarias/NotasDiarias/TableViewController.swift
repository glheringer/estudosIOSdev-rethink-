//
//  TableViewController.swift
//  NotasDiarias
//
//  Created by Rethink on 16/03/22.
//

import UIKit
import CoreData

class TableViewController : UITableViewController{
    
    var context: NSManagedObjectContext!
    var anotacoes : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.recuperaAnotacoes()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let anotacao = self.anotacoes [indexPath.row]
            
            self.context.delete(anotacao)
            self.anotacoes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try context.save()
            } catch let erro {
                print("Erro ao remover item \(erro)")
            }
        }
    }
    func recuperaAnotacoes() {
        let requisao = NSFetchRequest<NSFetchRequestResult>(entityName: "Anotacao")
        do {
            let anotacoesRecuperadas = try context.fetch(requisao)
            self.anotacoes = anotacoesRecuperadas as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch let erro as Error {
            print("Erro ao listar: \(erro.localizedDescription)")
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.anotacoes.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let anotacao = anotacoes[indexPath.row]
        self.performSegue(withIdentifier: "verAnotacao", sender: anotacao)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verAnotacao"{
            let viewDestino = segue.destination as! AddViewController
            viewDestino.anotacao = sender as? NSManagedObject
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaReuso" , for: indexPath)
        let anotacao = self.anotacoes[indexPath.row]
        let texto = anotacao.value(forKey: "texto")
        let data = anotacao.value(forKey: "data")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
        let novaData = dateFormatter.string(from: data as! Date)
        
        celula.textLabel?.text = texto as? String
        celula.detailTextLabel?.text = novaData
        return celula
    }
}
