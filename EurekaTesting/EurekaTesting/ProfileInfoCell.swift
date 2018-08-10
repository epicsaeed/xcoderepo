//
//  ProfileInfoCell.swift
//  EurekaTesting
//
//  Created by Saeed on 09.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import Foundation
import Eureka

struct User: Equatable {
    var username: String
    var jersey: String
    var team: String
    var image: UIImage
}

final class ProfileInfoRow: Row<ProfileInfoCell>, RowType{
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<ProfileInfoCell>(nibName: "ProfileInfoCell")
    }
}


final class ProfileInfoCell: Cell<User>, CellType{
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var jerseyLabel: UILabel!
    
    required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setup() {
        super.setup()
        
        // we do not want our cell to be selected in this case. If you use such a cell in a list then you might want to change this.
        selectionStyle = .none
        
        // configure our profile picture imageView
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        
        // define fonts for the labels
        usernameLabel.font = .systemFont(ofSize: 25)
        teamLabel.font = .systemFont(ofSize: 17)
        jerseyLabel.font = .systemFont(ofSize: 17)
        
        // specify the desired height for our cell
        height = { return 120 }
    }
    
    override func update(){
        super.update()
        
        // we do not want to show the default UITableViewCell's textLabel
        textLabel?.text = nil
        
        // get the value from our row
        guard let User = row.value else { return }
        
        // set text labels
        usernameLabel.text = User.username
        teamLabel.text = User.team
        jerseyLabel.text = User.jersey
        profileImageView.image = User.image

    }
    
    
}
