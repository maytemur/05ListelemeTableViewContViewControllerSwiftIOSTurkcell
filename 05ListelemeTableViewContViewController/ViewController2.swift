//
//  ViewController2.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 7.02.2023.
//

import UIKit

class ViewController2: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var KisiListesi : [Kisi] = []

    @IBOutlet weak var tvKisiler: UITableView!  //tableviewKisiler
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        KisiListesi.append(Kisi(ad: "Ad1", soyad: "Soyad1", cinsiyet: "E"))
        KisiListesi.append(Kisi(ad: "Ad2", soyad: "Soyad2", cinsiyet: "K"))
        KisiListesi.append(Kisi(ad: "Ad3", soyad: "Soyad3", cinsiyet: "E"))
        KisiListesi.append(Kisi(ad: "Ad4", soyad: "Soyad4", cinsiyet: "K"))
        KisiListesi.append(Kisi(ad: "Ad5", soyad: "Soyad5", cinsiyet: "E"))
        
        tvKisiler.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let temaValue = Ayarlar.shared.temarenk
        view.backgroundColor = UIColor(named: temaValue)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KisiListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("KisiTableViewCell", owner: self, options: nil)?.first as! KisiTableViewCell
        //KisiTableViewCell xib dosyasını bu şekilde yüklüyoruz
        //şimdi hücrenin içeriğini dolduralım
        
        let kisi = KisiListesi[indexPath.row]
        cell.lblAdSoyad.text = kisi.Ad + " " + kisi.Soyad
        
        if kisi.Cinsiyet == "E" {
            cell.imgCinsiyet.image = UIImage(named: "man")
        } else {
            cell.imgCinsiyet.image = UIImage(named: "woman")
        }
        
        return cell
        
        //son olarak özel xib cell row height'ı 80 yapmıştık table view row height'ını buna uygun değiştirelim
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
