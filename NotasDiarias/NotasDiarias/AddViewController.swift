//
//  AddViewController.swift
//  NotasDiarias
//
//  Created by Rethink on 16/03/22.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    @IBOutlet weak var texto: UITextView!
    var context : NSManagedObjectContext!
    var anotacao : NSManagedObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configuracoes iniciais
        self.texto.becomeFirstResponder()
        if self.anotacao != nil {
            //atualizar dados
            if let texto =  anotacao.value(forKey: "texto"){    //recuperar o texto que ja foi digitado
                self.texto.text = texto as? String
            }
        }
        else{
            self.texto.text = ""
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    @IBAction func salvar(_ sender: Any) {
        if self.anotacao != nil {
            //funcao de atualizar anotacao em si
            self.atualizarAnotacao()
        }
        else{
            self.salvarAnotacao()
        }

    }
    func atualizarAnotacao(){
        
        anotacao.setValue(self.texto.text, forKey: "texto")
        anotacao.setValue( Date() , forKey: "data")
        
        do {
            try context.save()
            print ("Atualizado com sucesso")
        } catch let erro {
            print("Erro ao atualizar anotacao: \(erro.localizedDescription) ")
        }
        
    }
    func salvarAnotacao(){
        //Criar objeto
        let anotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: context)
        
        //Configura anotacao
        anotacao.setValue(self.texto.text, forKey: "texto")
        anotacao.setValue( Date() , forKey: "data")
        
        // Salvar anotacao
        do {
            try context.save()
            print ("Salvo com sucesso")
        } catch let erro {
            print("Erro ao salvar anotacao: \(erro.localizedDescription) ")
        }
    }

}
