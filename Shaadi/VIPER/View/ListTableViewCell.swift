//
//  ListTableViewCell.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userGenderLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var finalLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        acceptButton.layer.borderColor = UIColor.black.cgColor
        acceptButton.layer.borderWidth = 0.5
        rejectButton.layer.borderColor = UIColor.black.cgColor
        rejectButton.layer.borderWidth = 0.5
        rejectButton.setTitle("Reject", for: .normal)
        acceptButton.setTitle("Accept", for: .normal)
        finalLabel.isHidden = true
    }
    
    func setUserList(details: Results?) {
        userNameLabel.text = "\(details?.name?.title ?? "") \(details?.name?.first ?? "") \(details?.name?.last ?? "")"
        userMailLabel.text = details?.email
        userPhoneLabel.text = details?.phone
        userGenderLabel.text = details?.gender
    }
    
}
