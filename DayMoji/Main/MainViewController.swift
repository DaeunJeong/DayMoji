//
//  MainViewController.swift
//  DayMoji
//
//  Created by 정다은 on 2021/04/04.
//

import UIKit
import RxSwift
import RxDataSources

class MainViewController: UIViewController {
    static func newInstance(viewModel: MainViewModel) -> MainViewController {
        let vc = MainViewController(nibName: "MainViewController", bundle: nil)
        vc.viewModel = viewModel
        return vc
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: MainViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        viewModel.requestDiaries()
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
        collectionView.register(UINib(nibName: "DiaryCell", bundle: nil), forCellWithReuseIdentifier: "DiaryCell")
        collectionView.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfDiary>(
          configureCell: { dataSource, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath)
            
            if let cell = cell as? DiaryCell {
                cell.diary = item
                return cell
            }
            return cell
        })
        
        viewModel.sections
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    @objc private func tapAddButton() {
        
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 48
        let height = width * 4 / 3
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}
