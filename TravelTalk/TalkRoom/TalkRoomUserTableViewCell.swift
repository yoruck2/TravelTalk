//
//  TalkRoomUserTableViewCell.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import UIKit

class TalkRoomUserTableViewCell: UITableViewCell {

    var data: Chat?
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
        messageLabel.backgroundColor = #colorLiteral(red: 0.9058824182, green: 0.9058824182, blue: 0.9058824182, alpha: 1)
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.numberOfLines = 0
        messageLabel.clipsToBounds = true
        
        messageTimeLabel.font = .systemFont(ofSize: 13)
        messageTimeLabel.textColor = .gray
    }
    
    func configureData() {
        messageLabel.text = data?.message
        messageTimeLabel.text = data?.date.formattedTime
    }
}
