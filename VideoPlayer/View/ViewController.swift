//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Quipper Ltd. on 8/27/21.
//

import UIKit
import RxCocoa
import RxSwift
import Foundation

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    private let bag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.getVideos()

    }
    
    func setupTableView() {
//        tableView.dataSource = self
//        tableView.delegate = self
        
        tableView.register(
            UINib(nibName: "Cell", bundle: .main),
            forCellReuseIdentifier: "Cell"//要不要写成CommentCell.reuseId
        )
        
        viewModel.videos
            .bind(to:
                tableView.rx.items(
                    cellIdentifier: "Cell",
                    cellType: Cell.self)
            ) { [weak self] row, video, cell in
                guard let self = self else { return }
                print("@@@", row, video)
                cell.config(video)
            }
            .disposed(by: bag)
        
        tableView.rx.willDisplayCell
            .subscribe(onNext: { [weak self] _, indexPath in
                guard let self = self else { return }

            })
            .disposed(by: bag)
        
        tableView.rx.itemSelected
                 .subscribe(onNext: { [weak self] indexPath in
                     guard let self = self else { return }
                   self.tableView.deselectRow(at: indexPath, animated: true)
                 }).disposed(by: bag)
    }
}

