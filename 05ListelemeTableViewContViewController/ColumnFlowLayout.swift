//
//  ColumnFlowLayout.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 9.02.2023.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    //bunun içinde kaç tane sütun ve satırların arasındaki boşluklar ile dinamik olarak satır sütun oranlarını belirtiyoruz. Örneğin küçük iphone6 ile iphone11 arasında aynı görüntüyü vermesini burada sağlıyoruz
    
    let sutunsayisi : Int
    var yukseklikOrani : CGFloat = (3.0 / 2.0)  //2.0/3.0 dan 3/2 ye değiştirdik
    
    init(sutunsayisi : Int, minSutunAraligi : CGFloat = 0, minSatirAraligi : CGFloat = 0) {
        self.sutunsayisi = sutunsayisi
        super.init()
        
        self.minimumInteritemSpacing = minSutunAraligi
        self.minimumLineSpacing = minSatirAraligi
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        //içinde bulunduğumuz flow layout'un collectien view'ine erişmemiz gerekiyor çünkü collection view'in genişliğine ihtiyacımız var bu genişliği dinamik olarak kullanıcaz
        //guard let ile alabiliriz dedi
        guard let collectionView = collectionView else {return}
        
        let araliklar = collectionView.safeAreaInsets.left+collectionView.safeAreaInsets.right+minimumInteritemSpacing*CGFloat(sutunsayisi-1)
        let elemanGenisligi = ((collectionView.bounds.size
                                    .width - araliklar) / CGFloat(sutunsayisi)).rounded(.down)
        let elemanYuksekligi = elemanGenisligi*yukseklikOrani
        
        itemSize=CGSize(width: elemanGenisligi, height: elemanYuksekligi)
        
        //artık bu aldığımız değerleri CVCViewController içinde register ettikten sonra kullanabiliriz
    }
}
