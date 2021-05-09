//
//  MainViewController.swift
//  DayMoji
//
//  Created by 정다은 on 2021/04/04.
//

import UIKit

class MainViewController: UIViewController {
    static func newInstance() -> MainViewController {
        let vc = MainViewController(nibName: "MainViewController", bundle: nil)
        return vc
    }

    @IBOutlet weak var collectionView: UICollectionView!
    private var diaries: [Diary] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    private let cellId = "DiaryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        
        /*
        diaries = [
        Diary(emojiText: "🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀🤞😀", hint: "", date: Date(timeIntervalSinceNow: -876543)),
            Diary(emojiText: "😀😀😀", hint: "", date: Date())
        ]
         */
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddButton))
        addButton.tintColor = UIColor.purple
        navigationItem.rightBarButtonItem = addButton
        title = "DayMoji"
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    @objc private func tapAddButton() {
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diaries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiaryCell
        cell.diary = diaries[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 48
        let height = width * 4 / 3
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}
