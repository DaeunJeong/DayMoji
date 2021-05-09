//
//  DateExtension.swift
//  DayMoji
//
//  Created by 정다은 on 2021/05/09.
//

import Foundation

extension Date {
    var normalDateString: String {
        let month = Calendar.current.component(.month, from: self)
        let day = Calendar.current.component(.day, from: self)
        let weekday = Calendar.current.component(.weekday, from: self).converToWeekDay()
        return "\(month)월 \(day)일 (\(weekday))"
    }
}
