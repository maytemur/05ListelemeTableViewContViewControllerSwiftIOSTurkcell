//
//  CVCViewController.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 8.02.2023.
//  Collection View Controller(CVC diye kısalttım)'ın table view controller dan veya cell'den farkı şu; CVC de 1 den fazla sütün ile listeleme yapmak mümkün ve custom olarak yapmakda yine mümkün

//  burada CVC eklemedik onun yerine view controller içine collection view ekledik. CVC nin controller view den farkı table view'in table view controller'dan farkı ile aynı dedi! sanırım bu daha kullanışlı istenirse geriye dönük farklarına bakılabilir
//controller view ekledikden sonra ilgili cocoa touch class'ını OzelCVC olarak xib ile beraber UIcollection view cell seçili iken oluşturduk. Burası altta UICollectionViewCell seçili olması önemli

//daha sonra xib dosyası içine bir adet lebel ekleyip outlet'ini oluşturduk


import UIKit

class CVCViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var cvliste: UICollectionView! //collectionview liste
    
    var ozelliste = ["Ozel 1","Ozel 2","Ozel 3","Ozel 4","Ozel 5","Ozel 6","Ozel 7","Ozel 8","Ozel 9","Ozel 10","Ozel 11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView den farklı olarak collection view de register etmemiz gerekiyor
        //normal storyboard içinde gelen cell ile yapmak içinde şunu eklememiz gerekiyordu biz burda xib ile yaptığımız için onu ekledik
        // cvliste.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        
        
        //xib ile register için
        cvliste.register(UINib(nibName: "OzelCVC", bundle: nil), forCellWithReuseIdentifier: "OzelCVC")
        
        cvliste.collectionViewLayout = ColumnFlowLayout(sutunsayisi: 3, minSutunAraligi: 5, minSatirAraligi: 7)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let temaValue = Ayarlar.shared.temarenk
        view.backgroundColor = UIColor(named: temaValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ozelliste.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //yukarıda register ettiğimiz için identifier'ı olan bir hücre olarak görüyor ve OzelCVC olarak verebiliyoruz
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "OzelCVC", for: indexPath) as! OzelCVC
        
        hucre.lblMetin.text = ozelliste[indexPath.row]
        
        //herhangi bir flow belirtmezsek soldan sağa doğru yetmeyince alt satıra geçecek şekilde listeleme yapıyor. Xib dosyasında label font değeri ne verilirse otomatik olarak o büyüklüğe göre cell büyüklüğünü ayarlıyor bu ayarlarda değiştirilebilir bakmak lazım!
        //normalde örneğin ürün listelerken vs 2 kolon şeklinde ürünler listelenir bunun içinse yeni bir cocoa touch class üretip (UICollectionViewFlowLayout tipinde burasu önemli) bu class'ın içinde gerekli ayarlamaları yapmamız gerek. Burada ColumnFlowLayout isminde bir cocoatouchclass oluşturduk.
        
        return hucre
    }
    
}
