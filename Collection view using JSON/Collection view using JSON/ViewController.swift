//
//  ViewController.swift
//  Collection view using JSON
//
//  Created by Powerplay on 29/12/22.
//

import UIKit

struct Hero: Decodable {
    let localized_name: String
    let img: String
}

class ViewController: UIViewController {

    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        //For parsing
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([Hero].self, from: data!)
                }
                catch {
                    print("Parse error!")
                }
                
                DispatchQueue.main.async {
                    print(self.heroes.count)
                }
            }
        }.resume()
    }


}

