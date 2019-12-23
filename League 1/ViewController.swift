//
//  ViewController.swift
//  League 1
//
//  Created by Rodolpho Chabi BABATOUNDE on 15/12/2019.
//  Copyright © 2019 Rodolpho Chabi BABATOUNDE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var scoresJson: [String:AnyObject] = [:]
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableauDesResultats = scoresJson["resultats"] as! NSArray
        return tableauDesResultats.count;
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ligne = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath) as! Ligne
        let tableauDesResultats = scoresJson["resultats"] as! NSArray
        let unResultat = tableauDesResultats[indexPath.row] as! [String:AnyObject]
        let domName = unResultat["dom_name"] as! String
        var score = unResultat["score"] as! String
        if score == ""{
           score = "-"
        }
        let extName = unResultat["ext_name"] as! String
        let dateMatch = unResultat["date"] as! String
        let logoDomicile = unResultat["dom_logo_name"] as! String
        let logoExterieur = unResultat["ext_logo_name"] as! String
        let logoDomicileUrl = unResultat["dom_logo_url"] as! String
        let logoExterieurUrl = unResultat["ext_logo_url"] as! String
        ligne.domLabel.text = domName
        ligne.scoreLabel.text = score
        ligne.extLabel.text = extName
        ligne.dateLabel.text = dateMatch
    
        //=== IMAGE EN LOCAL
            
            var nomFichier = String("/assets/"+logoDomicile.replacingOccurrences(of: logoExterieur.suffix(4), with: ""))
            var path = Bundle.main.path(forResource: nomFichier, ofType: "png")
            if ((path) != nil) {
                ligne.domLogo.image = UIImage(contentsOfFile:path!)
            }
            nomFichier = String("/assets/"+logoExterieur.replacingOccurrences(of: logoExterieur.suffix(4), with: ""))
            path = Bundle.main.path(forResource: nomFichier, ofType: "png")
            if ((path) != nil) {
                ligne.extLogo.image = UIImage(contentsOfFile:path!)
            }
            
    
        //=== IMAGE EN LIGNE
           
    
        return ligne
   }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    func getData() -> [String:AnyObject] {
        /*
        //=======Récupération du JSON  en local et parssage en objet ===== /
        let path = Bundle.main.path(forResource: "/assets/scb_resultats", ofType: "json")
        let data:NSData = try! NSData(contentsOfFile:path!)
        var jsonData: [String:AnyObject] = [:]
        do {
            jsonData = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String:AnyObject]
            print(jsonData)
        } catch let error as NSError {
            print(error)
        }
        */
        
        //=======Récupération du JSON  en ligne et parssage en objet ===== /
        let apiURL = "https://mathieu.goodbarber.com/docs/scb_resultats.json"
        let data:NSData = try! NSData(contentsOf: URL(string:apiURL)!)
        var jsonData : [String:AnyObject] = [:]
        do {
            jsonData = try JSONSerialization.jsonObject(with: data
                as Data, options: .allowFragments) as! [String:AnyObject]
        } catch let error as NSError {
            print(error)
        }
        return jsonData
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Récupération du JSON en local ou en ligne
        scoresJson = getData()
        
        
        
        guard let resultats = scoresJson["resultats"] as? NSArray else {
           return
        }
        
        
        
        
        //Création d'une tableView
        let tableView = UITableView(frame: self.view.bounds)
        tableView.register(Ligne.self, forCellReuseIdentifier: "Default")
        tableView.dataSource = self
        tableView.delegate = self
        
        //Création des lignes de table view pour chaque résultat
        for i in resultats
        {
            let nouVelleLigne = Ligne()
            tableView.addSubview(nouVelleLigne)
        }
        
        self.view.addSubview(tableView)
        
    }


}

