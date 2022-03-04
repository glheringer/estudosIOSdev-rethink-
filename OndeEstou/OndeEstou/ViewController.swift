//
//  ViewController.swift
//  OndeEstou
//
//  Created by Rethink on 02/03/22.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate{
    

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao =  CLLocationManager ()

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()

        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      
        let localizacaoUsuario = locations.last!

        let latitude = localizacaoUsuario.coordinate.latitude
        let longitude = localizacaoUsuario.coordinate.longitude
        let latitudeDelta = 0.01
        let longitudeDelta = 0.01

        self.latitudeLabel.text = String(latitude)
        self.longitudeLabel.text = String(longitude)
        if (localizacaoUsuario.speed) > 0 {
            self.velocidadeLabel.text = String(localizacaoUsuario.speed)
        }
       

        let areaVizualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let localizacao:CLLocationCoordinate2D  = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVizualizacao)

        mapa.setRegion(regiao, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { (detalhesLocal, erro) in
            if let dadosLocal = detalhesLocal?.first {
                var thoroughfare = ""
                if dadosLocal.thoroughfare != nil{
                    thoroughfare = dadosLocal.thoroughfare!
                }
                var subThoroughfare = ""
                if dadosLocal.subThoroughfare != nil{
                    subThoroughfare = dadosLocal.subThoroughfare!
                }
                var locality = ""
                if dadosLocal.locality != nil{
                    locality = dadosLocal.locality!
                }
                var subLocality = ""
                if dadosLocal.subLocality != nil{
                    subLocality = dadosLocal.subLocality!
                }
                var country = ""
                if dadosLocal.country != nil{
                    country = dadosLocal.country!
                }
                var administrativeArea = ""
                if dadosLocal.administrativeArea != nil{
                    administrativeArea = dadosLocal.administrativeArea!
                }
                var subAdministrativeArea = ""
                if dadosLocal.subAdministrativeArea != nil{
                    subAdministrativeArea = dadosLocal.subAdministrativeArea!
                }
                self.enderecoLabel.text = thoroughfare + ", " + subThoroughfare + ", " + locality + ", " + country + " . "
            }
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) { // O metodo relatado no video se tornou obsoleto, porem este realiza a mesma acao, mas de forma mais simples, necessario apenas usar o manager para tudo.
        let status = manager.authorizationStatus

        if status != .authorizedWhenInUse{
            let alertaController = UIAlertController (title: "Permissao para localizacao", message: "Necessario a autorizacao ao acesso da localizacao do usuario para o uso do app.", preferredStyle: .alert)
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)

            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configuracoes", style: .default) { acaoConfiguracoes in
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            }

            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)

            present(alertaController, animated: true, completion: nil)
        }
    }


}

