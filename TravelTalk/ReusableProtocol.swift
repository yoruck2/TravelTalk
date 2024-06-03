//
//  reusableProtocol.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var identifier: String { get }
    
}

extension UITableViewCell: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
    
    func registerCell(to tableView: UITableView, cellId: String) {
        let nib = UINib(nibName: cellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
}
