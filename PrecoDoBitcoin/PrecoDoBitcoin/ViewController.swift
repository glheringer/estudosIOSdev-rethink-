//
//  ViewController.swift
//  PrecoDoBitcoin
//
//  Created by Rethink on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinPrice: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBAction func update(_ sender: Any) {
        self.getBitcoinPrice()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getBitcoinPrice()
        
        
     
    }
    func priceFormatter ( price : NSNumber ) -> String {
        let nf = NumberFormatter() //Objeto formatador de preco
        nf.numberStyle = .decimal //Estilo
        nf.locale = Locale(identifier: "pt_BR") //Programar para seguir o padrao PT-BR
        
        if let formatedPrice =  nf.string(from: price){
            return formatedPrice
        }
        return "0,00"
        
    }
    func getBitcoinPrice (){
        self.updateButton.setTitle("Atualizando...", for: .normal)
        
        if let url = URL(string: "https://www.mercadobitcoin.net/api/BTC/ticker/"){ //Link da API
            
            let task = URLSession.shared.dataTask(with: url) { (data, request, erro) in //Metodo para chamar a API
                if erro == nil{
                    if let dataReturn = data {
                        do {
                            if let jsonObject = try JSONSerialization.jsonObject(with: dataReturn, options: [] ) as? [String: Any] { // Metodo que executa a API
                                if let ticker = jsonObject["ticker"] as? [String : Any]{ //Filtrando dados que queremos buscar na API
                                    if let price = Double(ticker["buy"] as! Substring){ //Filtrando dados da API mais profudamente, e assim por diante, cadeia de IF`s
                                       
                                        let formatedPrice = self.priceFormatter(price: NSNumber(value: price)) //Formatando valor Double para String, padrao PT-BR, com virgula em vez de ponto
                                        
                                        // Sempre que se desejar atualizar uma interface dentro de uma closure é necessario chamar esse metodo, para criar uma thread e executar corretamente
                                        DispatchQueue.main.async {
                                            self.bitcoinPrice.text = "R$ \(formatedPrice)"
                                            self.updateButton.setTitle("Atualizar", for: .normal)
                                        }
                                     
                                        
                                    }

                                    
                                }
                            }
                            
                        } catch  {
                            print("Falha ao formatar objeto json")
                        }
                    }
                }
                else{
                    print("Falha ao fazer consulta de preco")
                }
                
            }
            task.resume()
        }
    }


}

