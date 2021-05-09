//
//  IntExtension.swift
//  DayMoji
//
//  Created by 정다은 on 2021/05/09.
//

import Foundation

extension Int {
    func converToWeekDay() -> String {
        let weekdays = ["토", "일", "월", "화", "수", "목", "금"]
        return weekdays[self % 7]
    }
}
