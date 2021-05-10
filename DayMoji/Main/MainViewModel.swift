//
//  MainViewModel.swift
//  DayMoji
//
//  Created by 정다은 on 2021/04/04.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

struct MainViewModel {
    private let diaries = BehaviorRelay<[Diary]>(value: [])
    var sections: Observable<[SectionOfDiary]>
    
    init() {
        sections = diaries.map({ diaries in
            [SectionOfDiary(id: "diareies \(diaries.count)",
                            items: diaries)]
        })
    }
    
    func requestDiaries() {
        diaries.accept([
            Diary(emojiText: "🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀", hint: "", date: Date(timeIntervalSinceNow: -876543)),
            Diary(emojiText: "😀😀😀", hint: "", date: Date())
        ])
    }
}

struct SectionOfDiary {
    var id: String
    var items: [Item]
}

extension SectionOfDiary: SectionModelType {
    typealias Item = Diary
    
    init(original: SectionOfDiary, items: [Item]) {
        self = original
        self.items = items
    }
}
