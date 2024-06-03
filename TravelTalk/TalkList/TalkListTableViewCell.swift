//
//  TalkListTableViewCell.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import UIKit

class TalkListTableViewCell: UITableViewCell {

    var data: ChatRoom?
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var talkRoomTitleLabel: UILabel!
    @IBOutlet var recentMessageLabel: UILabel!
    @IBOutlet var recentMessageDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
//    override func layoutSubviews() {
//        setUpData()
//    }
    
    func configureLayout() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
        talkRoomTitleLabel.font = .boldSystemFont(ofSize: 15)
        
        recentMessageLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        recentMessageLabel.textColor = #colorLiteral(red: 0.4661759734, green: 0.4578384757, blue: 0.5037643909, alpha: 1)
        recentMessageDateLabel.font = .systemFont(ofSize: 14)
        recentMessageDateLabel.textColor = #colorLiteral(red: 0.5764706731, green: 0.5764706731, blue: 0.5764706731, alpha: 1)
        
    }
    
    func setUpData() {
        guard let data else {
            return
        }
        profileImageView.image = UIImage(named: data.chatroomImage[0])
        talkRoomTitleLabel.text = data.chatroomName
        recentMessageLabel.text = data.chatList.last?.message
        recentMessageDateLabel.text = data.chatList.last?.date
    }
}
