//
//  ViewController.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 3.02.2023.
//
//Ekranda bulunan bir metin alanından girilen değerin ekleme butonuna basınca table view listesine eklenmesini yapacapız

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var textAlani: UITextField!
    @IBOutlet weak var tableViewListe: UITableView!
    
    var liste : [String] = []
    
    //var modelayarlari : Ayarlar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor(named: temaValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print(modelayarlari?.UserDefYukle(anahtar: "tema"))
        
        
        // Do any additional setup after loading the view.
//        if (UserDefaults.standard.string(forKey: "tema") != nil) {
//            if (UserDefaults.standard.string(forKey: "tema") == "K"){
//           view.backgroundColor = UIColor(named: "koyu")
//                UserDefaults.standard.synchronize()
//            }
//        }
        
        //ayarlar menüsünden döndükten sonra tema ayarını tekrar yükleyelim
        //UserDefaults.standard.synchronize()
        let temaValue = Ayarlar.shared.temarenk
        view.backgroundColor = UIColor(named: temaValue)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        liste.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var hucre = UITableViewCell()
        
        hucre.textLabel?.text = liste[indexPath.row]
        hucre.backgroundColor = .lightGray
        
        return hucre
    }
    

    @IBAction func btnEkle(_ sender: Any) {
        
        if (textAlani.text != "") {
            liste.append(textAlani.text!) //text dolu gelecek eminiz dedik
        }
        
//        tableViewListe.backgroundColor = .lightGray
        tableViewListe.reloadData() //ekledikten sonra refresh etsin
      
    }
    
    //standart olarak gelen table listesindeki elemanı sola çekince silme işlemini iphone'da yapabilmek için
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            liste.remove(at: indexPath.row)
            tableViewListe.reloadData()
        }
    }
    
    //delete tuşunu özelleştirirsek iOs 13 ve öncesi için farklı tasarım yapmamız gerekir!!
}
