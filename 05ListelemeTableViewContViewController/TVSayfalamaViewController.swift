//
//  TVSayfalamaViewController.swift
//  05ListelemeTableViewContViewController
//
//  Created by maytemur on 13.02.2023.
//
// 100 tane ürünü Table View içinde göstereceğimiz zaman bunun hepsini birden yüklenmesini istemeyiz bu hem zaman kaybı olur kullanıcıyı bekletir hemde gereksiz bir işlem olur bu yüzden table view sayfalamayı kullanıyoruz

import UIKit

class TVSayfalamaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var sbBar: UISearchBar!
    @IBOutlet weak var tvSayfalama: UITableView!
    
    @IBOutlet weak var tftextAra: UITextField!
    
    
    var listemiz : [String] = []
    
    var filteredList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvSayfalama.dataSource = self  ;
        tvSayfalama.delegate = self
        
        ElemanEkle()
        
        filteredList.append(contentsOf: listemiz)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let temaValue = Ayarlar.shared.temarenk
        view.backgroundColor = UIColor(named: temaValue)
    }
    
    func ElemanEkle(){
        //burada liste sabit ama bu internetten çektiğimiz sürekli gelen bir datada olabilir
        // veri çekme işleminide burada yapabiliriz
        var listeEklenecek = ["Suri","Isabella Jane","Connor","Indio Falconer","Avri Roel","Exton Elias","item1","item13","item21","item231","item3431","item1231","item11","item221","item75671","item5671"]
        
        listemiz.append(contentsOf: listeEklenecek)
        
        tvSayfalama.reloadData() //reload scroll'u en başa almaz almasını istiyorsak bunu ayrıca bildirmemiz gerekiyor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listemiz.count
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = UITableViewCell()
        
        //hucre.textLabel?.text = listemiz[indexPath.row] + " \(indexPath.row)" //index numarasını hücrenin sağına ekledik
//        hucre.textLabel?.text = listemiz[indexPath.row]
        hucre.textLabel?.text = filteredList[indexPath.row]
        return hucre
    }
    
    //scroll'un pozisyonu almamız gerekiyor, ne zaman yükleme yapacağını söylememiz için
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) {
            //eğer yaptığımız scroll başlalngıç scroll pozisyonunu geçerse tekrar eleman yüklenmesini istiyoruz
            //sonuna geldiğimizde çok azda olsa beklemesin yüklemesini istiyorsak değeri 0.9 ile çarpabiliriz scrollView.contentSize.height*0.9 şeklinde
            ElemanEkle()
            filteredList.append(contentsOf: listemiz)
        }
    }
    
    //SearchBar ekledikten sonra delegate'ini view controllera verip outlet'İni ekledik daha sonra ilgili UISearchBarDelegate bildirimini yaptık artık search bar'ı kullanbiliriz
    // searchbar yazdığımızda bir sürü tanımlı fonksiyon çıkıyor biz bunlardan textdidchange olanı kullanıcaz ve numberOfRowsInSection kısmındada artık bütün listeyi döndürmüyoruz çünkü o zaman filtreleme yapamayız return filtreli liste count diyoruz buradaki tanımlamış olduğumuz filtreli liste dizisine istediğimiz ismi vererek başta tanımlamamız lazım ben burada filteredList dedim
    //son olarak fonksyionda eğer searchbar text boş ise bütün listeyi döndür diyoruz ve istediğimiz ayarları burda belirtiyoruz case sensitive vs...
    //daha sonra filteredList'i önceki listemiz yerine kullanabileceğimiz gördüm ve tekrar listemiz olarak code'u değiştirdim
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        listemiz = searchText.isEmpty ? listemiz : listemiz.filter({ (str : String)
//            ->Bool in //koşul doğruysa ? sonraki ilk kısım yanlışsa : dan sonraki kısım çalışıyor
        filteredList = searchText.isEmpty ? listemiz : listemiz.filter({ (str : String)
            ->Bool in
            
            return str.range(of: searchText, options: .caseInsensitive) != nil
//            return str.range(of: searchText) != nil
        })
        
        tvSayfalama.reloadData()
    }
    
    //bazı yerlerde tasarımlar gereği search bar'ı kullanamıyoruz bu yerlerde özel custom kendimize search yapabileceğimiz bir text field ekledik
    //şu ana kadar text field için bir action oluşturmamıştık ,bir action oluşturuyoruz action'lardan editing changed olanı seçiyoruz
    
    
    @IBAction func tftextAraEC(_ sender: Any) {
        
        //filter metodu kullanmadan nasıl yapacağımızı görelim
        //önce listeyi boşaltıyoruz
        filteredList.removeAll()
        
        
        if tftextAra.text!.isEmpty {
            filteredList.append(contentsOf: listemiz)
        } else {
            
            for item in listemiz {
                if item.range(of: tftextAra.text!) != nil {
                    //yukarıdaki gibi caseInsensitive demediğimiz için default olarak case insensitive olacak!
                    filteredList.append(item)
                }
                
            }
        }
        tvSayfalama.reloadData()
    }
    
}
