//
//  TalkRoomViewController.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import UIKit

class TalkRoomViewController: UIViewController {
    
    @IBOutlet var talkRoomTableView: UITableView!
    @IBOutlet var talkRoomTextField: UITextField!
    
    var data: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureTextField()
        navigationItem.title = data?.chatroomName
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
    }
    
    func configureTableView() {
        
        talkRoomTableView.delegate = self
        talkRoomTableView.dataSource = self
        
        talkRoomTableView.rowHeight = UITableView.automaticDimension
        registerCell(to: talkRoomTableView, cellId: TalkRoomUserTableViewCell.identifier)
        registerCell(to: talkRoomTableView, cellId: TalkRoomFriendTableViewCell.identifier)
        
        talkRoomTableView.separatorStyle = .none
        
    }
}

extension TalkRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.chatList.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let data else {
            return UITableViewCell()
        }
        
        let chatData = data.chatList[indexPath.row]
        
        if chatData.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: TalkRoomUserTableViewCell.identifier,
                                                           for: indexPath) as! TalkRoomUserTableViewCell
            cell.data = chatData
//            cell.configureData()
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TalkRoomFriendTableViewCell.identifier, 
                                                     for: indexPath) as! TalkRoomFriendTableViewCell
            cell.data = chatData
//            cell.configureData()
            return cell
        }
    }
}

extension TalkRoomViewController: UITextFieldDelegate {
    func configureTextField() {
        talkRoomTextField.placeholder = "메세지를 입력하세요"
        
        let image = UIImage(named: "magnifyingglass")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0,y: 0, width: 36, height: 36)
        talkRoomTextField.rightView = imageView
        talkRoomTextField.rightViewMode = .always
        talkRoomTextField.backgroundColor = #colorLiteral(red: 0.9686273932, green: 0.9686273932, blue: 0.9686273932, alpha: 1)
    }
}
