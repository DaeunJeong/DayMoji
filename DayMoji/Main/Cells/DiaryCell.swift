//
//  DiaryCell.swift
//  DayMoji
//
//  Created by 정다은 on 2021/04/04.
//

import UIKit

class DiaryCell: UICollectionViewCell {

    var diary: Diary? {
        didSet {
            emojiLabel.text = diary?.emojiText
            dateLabel.text = diary?.date.normalDateString
        }
    }
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        emojiLabel.text = nil
        dateLabel.text = nil
        emojiLabel.font = .systemFont(ofSize: 18)
        dateLabel.font = .boldSystemFont(ofSize: 24)
        dateLabel.textColor = UIColor.lightGray
        
        layer.cornerRadius = 16
        setupUI()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupUI()
    }
    
    private func setupUI() {
        switch traitCollection.userInterfaceStyle {
        case .dark:
            backgroundColor = UIColor.black.withAlphaComponent(0.08)
        default:
            layer.masksToBounds = false
            layer.shadowOffset = CGSize(width: 10, height: 10)
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 12
            layer.shadowOpacity = 0.2
            backgroundColor = nil
            layer.backgroundColor = UIColor.white.cgColor
        }
    }
}
