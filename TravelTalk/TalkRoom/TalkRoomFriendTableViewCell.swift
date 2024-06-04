//
//  TalkRoomTableViewCell.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import UIKit

class TalkRoomFriendTableViewCell: UITableViewCell {

    var data: Chat?
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
        selectionStyle = .none
        
    }
    override func layoutSubviews() {
        configureData()
    }
    
    func configureLayout() {
        messageLabel.layer.cornerRadius = 10
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.borderColor = UIColor.lightGray.cgColor
        messageLabel.backgroundColor = #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.numberOfLines = 0
        messageLabel.clipsToBounds = true
        
        messageTimeLabel.font = .systemFont(ofSize: 13)
        messageTimeLabel.textColor = .gray
    }
    
    func configureData() {
        guard let data else {
            print("안됨")
            return
        }
        profileImageView.image = UIImage(named: data.user.rawValue)
        nameLabel.text = data.user.rawValue
        messageLabel.text = data.message
        messageTimeLabel.text = data.date.formattedTime
        print("됨")
    }

}
