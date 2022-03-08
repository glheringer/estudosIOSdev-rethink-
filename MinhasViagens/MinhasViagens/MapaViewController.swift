//
//  MapaViewController.swift
//  MinhasViagens
//
//  Created by Rethink on 04/03/22.
//
import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    let gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String,String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarGerenciadorLocalizacao()
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(MapaViewController.marcarMapa (gesto:)))
        reconhecedorGesto.minimumPressDuration = 2
        
        mapa.addGestureRecognizer(reconhecedorGesto)
    }
    
    @objc func marcarMapa (gesto: UIGestureRecognizer){
        
        if gesto.state == UIGestureRecognizer.State.began{
            print("Pressionado")
            //Recuperar Coordenadas de onde clicou
            let pontoSelecionado = gesto.location(in:self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            
           //recuperar  o endereco do ponto selecionado
            var localCompleto = "Endereco nao encontrado"
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            CLGeocoder().reverseGeocodeLocation(localizacao) { (detalhesLocal, erro)in
                if erro == nil{
                    if  let dadosLocal = detalhesLocal?.first {
                        if let nome = dadosLocal.name{
                            localCompleto = nome
                        }
                        else{
                            if let endereco = dadosLocal.thoroughfare{
                               localCompleto = endereco
                            }
                        }
                    }
                    // Recuperar informacoes do local marcado / Salvar dados no dispositivo
                    self.viagem = ["Local: " : localCompleto, "latitude: " : String(coordenadas.latitude) , "longitude: " : String(coordenadas.longitude)]
                    ArmazenamentoDados().salvarViagem(viagem: self.viagem)
                    print(ArmazenamentoDados().listarViagens())
                    
                    //Exibir anotacao no mapa
                    let anotacao = MKPointAnnotation()
                    anotacao.coordinate.latitude = coordenadas.latitude
                    anotacao.coordinate.longitude = coordenadas.longitude
                    anotacao.title = localCompleto
                    self.mapa.addAnnotation(anotacao)
                  
                    
                }
                else{
                    print(erro)
                }
            }
        }
    }
    func configurarGerenciadorLocalizacao () {
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        if status != .authorizedWhenInUse && status != .authorizedAlways{
            let alertaController = UIAlertController(title: "Permissao para localizacao", message: "Necessario o acesso à localizacao durante o uso do app", preferredStyle: .alert)
            let acaoCancelar  = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
          
            let acaoConfiguracoes = UIAlertAction(title: "Acessar Configuracoes", style: .default) { acaoConfiguracoes in
                if let configurar = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configurar as URL)
                }
            }
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            present(alertaController, animated: true, completion: nil)
        }
    }

}
