//
//  BolumLabViewController.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 20.02.2023.
// Bölüm Sonu Lab Uygulaması
// Başlık , kısa açıklama ve detaylı açıklaması olan bir makale yapısı olacak - burada yazmıyor ama 1 adette
// makale model'i yani swift dosyası class oluşturduk bunu yapı olarak oluşturmakla kastetmiş sanırım?
// Listede makalelerin başlık ve kısa açıklamaları görülebilecek
//  105 adet makale bulunacak ve 20 şerli olarak listeye yüklenecek
// Makale başlık ve detaylarında arama yapılabilecek, arama sonucu filtrenelecek

import UIKit

class BolumLabViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    
    @IBOutlet weak var sbar: UISearchBar!
    @IBOutlet weak var tview: UITableView!
    
    //3 tane liste lazım - biri tüm liste bir tanesi 20 adetlik diğeride filtreli olan
    var tumListe : [makale] = []
    var yuklenmisListe : [makale] = []
    var tumFiltreliListe : [makale] = []
    
    var sayfa = 0 //kaçinci sayfada olduğumuzu tutabilmek için dedi
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var m  :makale
        
        for i  in 0..<105 {
            m = makale(baslik: "Başlık\(i)", kisaAciklama: "Kısa Açıklama\(i)", aciklama: "Açıklama\(i)")
            tumListe.append(m)
            //tüm listeyi yükledik
            if i < 20 {
                yuklenmisListe.append(m)
            }
        }
        tumFiltreliListe.append(contentsOf: tumListe)
        tview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let temaValue = Ayarlar.shared.temarenk
        view.backgroundColor = UIColor(named: temaValue)
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yuklenmisListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let satir = Bundle.main.loadNibNamed("SatirTableViewCell", owner: self, options: nil)?.first as! SatirTableViewCell
        satir.basLbl.text = yuklenmisListe[indexPath.row].Baslik
        satir.infoLbl.text = yuklenmisListe[indexPath.row].KisaAciklama
        
        return satir
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height)) > (scrollView.contentSize.height*0.9) {
            ElemanEkle()
        }
    }
    
    func ElemanEkle(){
        if (((sayfa + 1)*20) < tumFiltreliListe.count){
            for i in ((sayfa + 1)*20)..<((sayfa + 2)*20) {
                if i < tumFiltreliListe.count {
                    yuklenmisListe.append(tumFiltreliListe[i])
                }
            }
            
            sayfa += 1
            tview.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sayfa = 0
        
        tumFiltreliListe = searchText.isEmpty ? tumListe : tumListe.filter({ (makale : makale) -> Bool in
            return makale.Baslik.range(of: searchText, options:  .caseInsensitive) != nil || makale.KisaAciklama.range(of: searchText, options:  .caseInsensitive) != nil
        })
        yuklenmisListe.removeAll()
        
        for i in 0..<tumFiltreliListe.count {
            if i<20 {
                yuklenmisListe.append(tumFiltreliListe[i])
            }
        }
        tview.reloadData()
    }
    
    //-----------------IOS 301 BAŞLANGIÇ- USER DEFAULTS - KULLANICI AYARLAR DEPOLAMA-----------------
    
    //User defaults içinde büyük veriler kaydedebilsekde büyük bilgileri database de kaydetmemiz gerekir bunun içinde eğer varsa kullanıcı ayarlarını örneğin sesler açık mı background layer dark mode vs vs kaydedebiliriz
    
    //genelde 3 fonksiyon yeterli oluyor - dictionary yapısında key valu olarak istediğimizi gönderebiliriz any olarak ve any olarakda alabiliriz
    //dictionary yapısı gereği bütün değerler optional olacaktır içinde hiç bir değer olmasada yapısı gereği böyle oluyormuş
        
    func UserDefKaydet(deger : String, anahtar : String){ //value : Any de olabilirdi
        
        let kullaniciAyarlari = UserDefaults.standard
        kullaniciAyarlari.set(deger, forKey: anahtar)
        kullaniciAyarlari.synchronize() //synchronize demeden kaydedilmez
    }
    
    func UserDefYukle(anahtar : String)-> String{
        
        if let ayar = UserDefaults.standard.string(forKey: anahtar){
            return ayar
        }
        return ""
    }
    
    func UserDefSil(anahtar : String){
        //object kullandık çünkü ne döneceğini bilmiyoruz
        if UserDefaults.standard.object(forKey: anahtar) != nil {
            UserDefaults.standard.removeObject(forKey: anahtar)
            UserDefaults.standard.synchronize()
        }
    }
    //bu 3 fonksiyon yeterli olacaktır ve bunları her projemizde rahatlıkla kullanabiliriz dediğine göre ve hatta bu fonksiyonu code snippet olarak xcode'un belleğine ekleyebiliriz bunun için code bloğu 3 fonksiyonu komple seçtikten sonra sağ tıklayıp menüden Create Code Snippet diyoruz!
    //Code Snippet olarak KullaniciAyarlari ismini verdim
    
    //küçük harfle kullaniciayarlari diyerek code tamamlama çıkar veya yukarıdan + diyerek çıkan menüden de eklenebilir
    
    
}
