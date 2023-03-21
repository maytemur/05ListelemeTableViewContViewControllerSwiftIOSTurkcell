//
//  UrunCVCViewController.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 11.02.2023.
//

import UIKit

class UrunCVCViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {


    @IBOutlet weak var urunlerCV: UICollectionView!
    
    var urunListe : [Urun] = [] //Urun modelinden oluşan boş bir liste oluşturduk
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Ürün modeline bir listede gönderebiliriz şimdilik böyle yazdık
        var u = Urun()
        u.Baslik = "Urun 1"
        u.Fİyat = 13
        u.KisaAciklama = "Ürün 1 için kısa açıklama"
        u.ResimAd = "urun1"
        
        urunListe.append(u)
        
        u = Urun()
        u.Baslik = "Urun 2"
        u.Fİyat = 123
        u.KisaAciklama = "Ürün 2 için kısa açıklama"
        u.ResimAd = "urun2"
        
        urunListe.append(u)
        
        u = Urun()
        u.Baslik = "Urun 3"
        u.Fİyat = 133
        u.KisaAciklama = "Ürün 3 için kısa açıklama"
        u.ResimAd = "man"
        
        urunListe.append(u)
        
        u = Urun()
        u.Baslik = "Urun 4"
        u.Fİyat = 1223
        u.KisaAciklama = "Ürün 4 için kısa açıklama"
        u.ResimAd = "woman"
        
        urunListe.append(u)
        
        u = Urun()
        u.Baslik = "Urun 5"
        u.Fİyat = 163
        u.KisaAciklama = "Ürün 5 için kısa açıklama"
        u.ResimAd = "urun1"
        
        urunListe.append(u)
        
        u = Urun()
        u.Baslik = "Urun 6"
        u.Fİyat = 1563
        u.KisaAciklama = "Ürün 6 için kısa açıklama"
        u.ResimAd = "urun2"
        
        urunListe.append(u)
        
        //cv mizi register edelim
        urunlerCV.register(UINib(nibName: "UrunCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: "UrunCollectionViewCell")
        //flow layout'u verelim
        urunlerCV.collectionViewLayout = ColumnFlowLayout(sutunsayisi: 2, minSutunAraligi: 7, minSatirAraligi: 15)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let temaValue = Ayarlar.shared.temarenk
        view.backgroundColor = UIColor(named: temaValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UrunCollectionViewCell", for: indexPath) as! UrunCollectionViewCell
        
        let u = urunListe[indexPath.row]
        
        cell.lblUrunAdi.text = u.Baslik
        cell.lblUrunAciklama.text = u.KisaAciklama
        cell.lblFiyat.text = "\(u.Fİyat!) TL"
        cell.imgUrun.image = UIImage(named: u.ResimAd!)

        return cell
    }
    

}
