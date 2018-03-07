//
//  TableViewCell.swift
//  uran_test_app
//
//  Created by George Heints on 07.03.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource {

    //Array to store temp data
    var array : [lists]? = []
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        
        imageCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    //CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath as IndexPath) as! CollectionViewCell
        
        //cell.productImage.downloadImg(from: (arrayImg?[indexPath.row].url)!)
        //cell.productImage.downloadImg(from: (test?[indexPath.row].imageUrl)!)
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    //CollectionView End
}

//required App Transport Security Settings
extension UIImageView{
    func downloadImg(from url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil{
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
