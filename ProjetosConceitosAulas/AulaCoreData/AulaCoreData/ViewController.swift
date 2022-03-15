//
//  ViewController.swift
//  AulaCoreData
//
//  Created by Rethink on 15/03/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        //Criar Entidade
        let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)

//        //Configurar Objeto
//        produto.setValue("Xiaomi Mi band 2", forKey: "descricao")
//        produto.setValue("Preto", forKey: "cor")
//        produto.setValue( 280.00 , forKey: "preco")
//
//        //Salvar (persistir) Dados
//        do {
//            try context.save()
//            print ("Dados Salvos Corretamente")
//        } catch  {
//            print("Falha ao salvar Dados")
//        }


        /* Listar Dados */
        //Criar Requisicao
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        //Criar Ordenacao de A-Z ou Z-A
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
//        let ordenacaoZA = NSSortDescriptor(key: "preco", ascending: false) // é possivel adicionar dois filtros, o que vier primeiro prevalece
        
        //Criar Filtro
        // [c] para desligar o case sensitive (nao fazer distincao entre letras maiusculas e minusculas
        // %@ é um caracter coringa, em que o valor do segundo parametro é atribuido a ele
        
        let predicate = NSPredicate(format: "descricao contains [c] %@", "Xiaomi Mi Band") // == , só funciona se for exatamente igual
//        let predicate = NSPredicate(format: "descricao contains [c] %@", "Echo") //contém
//        let predicate = NSPredicate(format: "descricao beginswith [c] %@", "F") //comeca com
//        let predicate = NSPredicate(format: "preco >= %@", "180.00") //outros operadores logicos tambem funcionam
        
        // Combinar filtros
//        let filtro1 = NSPredicate(format: "descricao contains [c] %@", "Band")
//        let filtro2 = NSPredicate(format: "preco >= %@", "180.00")
        
//        let combinaFiltro = NSCompoundPredicate(andPredicateWithSubpredicates: [filtro1, filtro2] )
        //Aplicar filtros â requisicao
        requisicao.sortDescriptors = [ordenacaoAZ]
        requisicao.predicate = predicate
        
        do {
            let produtosRecuperados = try context.fetch(requisicao)
            if produtosRecuperados.count > 0 {
                //listagem em si
                for produto in produtosRecuperados as! [NSManagedObject]{
                    if let descricacaoProd =  produto.value(forKey: "descricao"){
                        if let corProd = produto.value(forKey: "cor"){
                            if let precoProd = produto.value(forKey: "preco"){
                                print(" Descricao: \(descricacaoProd) | Cor: \(corProd) | Preco: \(precoProd)")
                                
                                 /*Atualizar Dados*/
//                                produto.setValue( 280.00 , forKey: "preco")
//                                produto.setValue( "Branco" , forKey: "cor")
//                                do {
//                                    try context.save()
//                                    print("Atualizou direitinho")
//                                } catch  {
//                                    print("Não atualizou direitinho")
//                                }
                                
//                                /*Remover Dados*/
//                                context.delete(produto)
//                                do {
//                                    try context.save()
//                                    print("Removido com sucesso")
//                                } catch  {
//                                    print("Não removido com sucesso")
//                                }
//
                            }
                        }
                    }
                }
            }
        } catch  {
            print("Falha ao gerar requisicao")
        }
        //Listagem
    }
}

