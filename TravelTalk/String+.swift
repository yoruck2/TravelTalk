//
//  dateFormmater+.swift
//  TravelTalk
//
//  Created by dopamint on 6/4/24.
//

import Foundation

extension String {
    var formattedDotDate: Self {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = formatter.date(from: self) else {
            return self
        }
        
        formatter.dateFormat = "yy.MM.dd"
        
        let outputDate = formatter.string(from: date)
        return outputDate
    }
    
    var formattedTime: Self {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = formatter.date(from: self) else {
            return self
        }
        formatter.locale = Locale(identifier:"ko_KR")
        formatter.dateFormat = "HH:mm a"
        
        let outputDate = formatter.string(from: date)
        return outputDate
    }
}
