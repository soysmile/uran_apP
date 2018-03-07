//
//  ViewController.swift
//  uran_test_app
//
//  Created by George Heints on 07.03.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! TableViewCell
        
        cell.productTitle?.text = self.array?[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    //TableViewEnd
    
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParse()
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    var array : [lists]? = []
    func jsonParse(){
        let url = "https://gist.githubusercontent.com/u-android/41ade05b6ae1133e7e86e9dfd55f1794/raw/bab1c383b0384d1a4c889b399ad7b13ae05634fa/ios%20challenge%20json"
        guard let urlPath = URL(string: url) else {return}
        URLSession.shared.dataTask(with: urlPath) { (data, response, error) in
            guard let data = data else{return}
            do{
                let courses = try JSONDecoder().decode(info.self, from: data)
                self.array = courses.list
                DispatchQueue.main.async {
                    
                    self.productTableView.reloadData()
                }
                
            }
            catch{
                print("error")
            }
            }.resume()
        
    }


}

