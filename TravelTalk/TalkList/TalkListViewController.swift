//
//  ViewController.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import UIKit



class TalkListViewController: UIViewController {
    
    @IBOutlet var talkListTableView: UITableView!
    
    let mockChats = MockChat().mockChatList
    lazy var searchedUserList: [ChatRoom] = mockChats {
        didSet {
            talkListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TRAVEL TALK"
        configureTableView()
        configureSearchBar()
    }
    
    func configureTableView() {
        talkListTableView.delegate = self
        talkListTableView.dataSource = self
        registerCell(to: talkListTableView, cellId: TalkListTableViewCell.identifier)
        talkListTableView.separatorStyle = .none
    }
}

extension TalkListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            searchedUserList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = searchedUserList[indexPath.row]
        
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TalkRoomViewController.identifier) as! TalkRoomViewController
            
            vc.data = data
            
            navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userData = searchedUserList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TalkListTableViewCell.identifier, for: indexPath) as! TalkListTableViewCell
        
        cell.data = userData
        cell.configureData()
        return cell
    }
}

extension TalkListViewController: UISearchResultsUpdating {
    
    // MARK: - 서치바 설정
    func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요"
    }
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else {
            searchedUserList = mockChats
            return
        }
        
        if text == "" {
            searchedUserList = mockChats
            
        } else {
            searchedUserList = mockChats.filter {
                $0.chatroomName.lowercased().contains(text)
            }
        }
    }
}
