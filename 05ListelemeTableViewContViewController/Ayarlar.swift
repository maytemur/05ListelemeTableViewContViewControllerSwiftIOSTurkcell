//
//  ayarlar.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 22.02.2023.
//

import Foundation
import UIKit

class Ayarlar {
    
    //    var defaulttema : String
    //    var koyutema : String
    //
    //    init(defaulttema : String , koyutema : String) {
    //        self.defaulttema = defaulttema
    //        self.koyutema = koyutema
    //    }
    
    //bunun yerine statik struct geri döndüren singleton yapısını kullanan şu code'u aldım
    //https://medium.com/swlh/how-to-handle-userdefaults-in-swift-83e1ded01a4d adresinden
    
    private let varsayilan = UserDefaults.standard
    
    private let keyIntExample = "intExample"
    
    var intExample : Int {
        set {
            varsayilan.setValue(newValue, forKey: keyIntExample)            
        }
        get {
            return varsayilan.integer(forKey: keyIntExample)
        }
    }
    

    
    //aşağıdaki 3 fonksiyon yeterli olsada çok kullanışlı olmayacaktır her seferinde okunan UserDefYukle diyerek alınan değer her bir viewcontroller'da tekrar tekrar if else içinde yoklanmak zorunda
    //ama yukarıdaki singleton struct class yapısı tek bir değer döndürdüğünden değeri önce default değerler olarak sonrasında ise değiştirilmiş değerler olarak saklamak ve her bir view controller'da söylenildiği gibi singleton yapısında almak çok daha kullanışlı
    //keyIntExample yerine key-value olarak any int string vs her şey olabilir
    //burada üstteki code'u orjinal olarak bırakıp(sadece defaults-varsayilan olarak değiştirildi) tema değeri A veya B veya direk olarak uzun acik ve kapali şeklinde varsa başka değerler içinde ilgili set-get class'ları kaç tane saklanması istenilen değer varsa burada yazılabilir her seferinde tek bir Static.instance dönecek!
    public var tema = "acik" //varsayılan değer
    
    var temarenk : String {
        set {
            varsayilan.setValue(newValue, forKey: tema)
            //varsayilan.synchronize()
            //tahmin ettiğim gibi artık sync etmeyede gerek yok ohaa!
        }
        get {
            return varsayilan.string(forKey: tema) ?? "acik" //nil gelirse varsayılan değer acik olacak ne olur olmaz diye optinal yaptım
        }
    }
    
    class var shared: Ayarlar {
        struct Static {
            static let instance = Ayarlar()
        }
        return Static.instance
        
    }
    
    //
    //    func UserDefKaydet(deger : String, anahtar : String){ //value : Any de olabilirdi
    //
    //        let kullaniciAyarlari = UserDefaults.standard
    //        kullaniciAyarlari.set(deger, forKey: anahtar)
    //        kullaniciAyarlari.synchronize() //synchronize demeden kaydedilmez
    //    }
    //
    //    func UserDefYukle(anahtar : String)-> String{
    //
    //        if let ayar = UserDefaults.standard.string(forKey: anahtar){
    //            return ayar
    //        }
    //        return ""
    //    }
    //
    //    func UserDefSil(anahtar : String){
    //        //object kullandık çünkü ne döneceğini bilmiyoruz
    //        if UserDefaults.standard.object(forKey: anahtar) != nil {
    //            UserDefaults.standard.removeObject(forKey: anahtar)
    //            UserDefaults.standard.synchronize()
    //        }
    //    }
    //bu 3 fonksiyon yeterli olacaktır ve bunları her projemizde rahatlıkla kullanabiliriz dediğine göre ve hatta bu fonksiyonu code snippet olarak xcode'un belleğine ekleyebiliriz bunun için code bloğu 3 fonksiyonu komple seçtikten sonra sağ tıklayıp menüden Create Code Snippet diyoruz!
    //Code Snippet olarak KullaniciAyarlari ismini verdim
}
