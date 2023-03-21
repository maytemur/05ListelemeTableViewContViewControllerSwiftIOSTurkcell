//
//  AyarlarViewController.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 22.02.2023.
//

import UIKit

class AyarlarViewController: UIViewController {
    //User defaults kullanarak uygulamanın temasının ayarlanmasını sağlayacağız
    //default tema açık renk olacak
    
    @IBOutlet weak var temaButon: UISegmentedControl!
    let ud = UserDefaults.standard
    //var modelayarlar : Ayarlar?
    //singleton sayesinde buna bile gerek yok direkt Ayarlar diyip istediğin class'dan vs erişebiliyorsun oha!!
    let temaValue = Ayarlar.shared.temarenk
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //ayar varsa yükleyelim
//        if (UserDefaults.standard.string(forKey: "tema") != nil) {
//            if (UserDefaults.standard.string(forKey: "tema") == "K"){
//                temaButon.selectedSegmentIndex = 1
//                TemaUygula(tema: "K")
//                ud.synchronize()
//            } else {
//                temaButon.selectedSegmentIndex = 0
//                TemaUygula(tema: "A")
//                ud.synchronize()
//            }
//        }
        
        //tema ayarını alalım uygulayalım
        self.view.backgroundColor = UIColor(named: temaValue)
        //tema butonun değerini uygulayalım
        if temaValue == "acik" {
            temaButon.selectedSegmentIndex = 0
        } else {
            temaButon.selectedSegmentIndex = 1
        }
        
        //2 tane problem var 1 - hemen tema ayarını yüklemiyor geri gelmek gerekiyor 2 - selected buton değerini hatırlamıyor
        
        //2 side let temaValue = Ayarlar.shared.temarenk atamaını class başında yaptığım için oluyormuş güncellemesi için kendini kapatıp açmak gerekiyormuş bu yüzden ,çok basit ama çok uğraştıran bir hata her zamanki gibi!
        //bundan sonra rss pod için örnek uygulamalara bakılarak gerçekten gerekli lazım olan ayarlar kolaylıkla eklenebilir sorun kalmadi
        //burada vakit kaybetmek yerine benzerini flutter ile veya android studio ile yaparak onunlada vakit kaybetmemek şu an için en mantıklısı
        //ios market fiyatı vs şu an için lüks!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //tema ayarını alalım uygulayalım
        self.view.backgroundColor = UIColor(named: temaValue)
        //tema butonun değerini uygulayalım
        if temaValue == "acik" {
            temaButon.selectedSegmentIndex = 0
        } else {
            temaButon.selectedSegmentIndex = 1
        }
    }
    
    
    @IBAction func TemaSec(_ sender: Any) {
        
        if temaButon.selectedSegmentIndex == 0 {
            //ud.set("A",forKey: "tema")
            //TemaUygula(tema: "A")
            //modelayarlar?.UserDefKaydet(deger: "A", anahtar: "tema") //tema ayarı kaydedildi
            
            // Get the value
            //let temaValue = Ayarlar.shared.temarenk
            // Set the value
            //Ayarlar.shared.temarenk = "koyu"
            
            //ayarı set ettik
            Ayarlar.shared.temarenk = "acik"
            //uygulayalım
            //view.backgroundColor = UIColor(named: "acik")
            let temaValue = Ayarlar.shared.temarenk
            view.backgroundColor = UIColor(named: temaValue)
            
        } else {
//            ud.set("K", forKey: "tema")
//            TemaUygula(tema: "K")
            
            Ayarlar.shared.temarenk = "koyu"
            //view.backgroundColor = UIColor(named: "koyu")
            let temaValue = Ayarlar.shared.temarenk
            view.backgroundColor = UIColor(named: temaValue)
        }
        //ud.synchronize()
        // büyük ihtimalle tek instance olduğu için bunada gerek olmayacak : ud.synchronize()
        
        
        
    }
    
    
//    func TemaUygula(tema : String){
//
//        ud.set(tema, forKey: "tema")
//
//        if UserDefaults.standard.string(forKey: "tema") == "K" {
//            view.backgroundColor = UIColor(named: "koyu")
//            //modelayarlar?.UserDefKaydet(deger: "K", anahtar: "tema")
//        } else {
//            view.backgroundColor = UIColor(named: "acik")
//           // modelayarlar?.UserDefKaydet(deger: "A", anahtar: "tema")
//        }
//    }
    
}
