//
//  AppDelegate.swift
//  League 1
//
//  Created by Rodolpho Chabi BABATOUNDE on 15/12/2019.
//  Copyright © 2019 Rodolpho Chabi BABATOUNDE. All rights reserved.
//


import UIKit

class Ligne: UITableViewCell{
    
    var domLabel : UILabel = UILabel()
    var scoreLabel : UILabel = UILabel()
    var extLabel : UILabel = UILabel()
    var dateLabel : UILabel = UILabel()
    var domLogo : UIImageView = UIImageView()
    var extLogo : UIImageView = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //== Date du match==//
        dateLabel.frame.size.width = self.frame.width
        dateLabel.frame.size.height = 20
        dateLabel.frame.origin.x =  0
        dateLabel.frame.origin.y = 0
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "normal", size: 12.0)
        dateLabel.textColor = UIColor.darkGray
        
        //== LOGO domicile==//
        domLogo.frame.size.width = self.frame.width / 3
        domLogo.frame.size.height = 40
        domLogo.frame.origin.x = 20
        domLogo.frame.origin.y = 5
        domLogo.contentMode =  .scaleAspectFit
        
        //==Equipe domicile==//
        domLabel.frame.size.width = domLogo.frame.size.width
        domLabel.frame.size.height = 20
        domLabel.frame.origin.x = 20
        domLabel.frame.origin.y = 30
        domLabel.textAlignment = .left
        //domLabel.backgroundColor = .blue
        
        //==Label du score==//
        scoreLabel.frame.size.width = self.frame.width / 3
        scoreLabel.frame.size.height = domLabel.frame.size.height
        scoreLabel.frame.origin.x = self.frame.width / 3//Commence à la fin du nom de l'équipe domicile
        scoreLabel.frame.origin.y = 30
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        scoreLabel.textAlignment = .center
        //scoreLabel.backgroundColor = .red
        
        //==Equipe extérieure==//
        extLabel.frame.size.width = self.frame.width / 3 - 20
        extLabel.frame.size.height = 20
        extLabel.frame.origin.x = self.frame.width / 3 * 2
        extLabel.frame.origin.y = 30
        extLabel.textAlignment = .right
        //extLabel.backgroundColor = .yellow
        
        //== LOGO extérieur==//
        extLogo.frame.size.width = extLabel.frame.size.width
        extLogo.frame.size.height = 40
        extLogo.frame.origin.x = self.frame.width / 3 * 2
        extLogo.frame.origin.y = 5
        extLogo.contentMode = .scaleAspectFit
        //extLogo.backgroundColor = .red
        
        
        //print(domLogo)
        dateLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        domLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        domLogo.autoresizingMask = [.flexibleRightMargin]
    
        scoreLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        extLabel.autoresizingMask = [.flexibleWidth, .flexibleLeftMargin, .flexibleHeight]
        extLogo.autoresizingMask = [.flexibleLeftMargin]
        
        
        self.addSubview(dateLabel)
        
        self.addSubview(domLogo)
        self.addSubview(domLabel)
        
        self.addSubview(scoreLabel)
        
        self.addSubview(extLabel)
        self.addSubview(extLogo)
        
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
