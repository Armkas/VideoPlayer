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
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModel()
    private let bag = DisposeBag()
    let playerViewController = AVPlayerViewController()
    let player = AVPlayer(playerItem: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupPlayer()
    }
    
    func setupTableView() {
        tableView.rowHeight = 108
        
        tableView.register(
            UINib(nibName: "Cell", bundle: .main),
            forCellReuseIdentifier: "Cell"
        )
        
        viewModel.videos
            .bind(to:
                    tableView.rx.items(
                        cellIdentifier: "Cell",
                        cellType: Cell.self)
            ) { [weak self] row, video, cell in
                guard let self = self else { return }
                cell.config(video)
            }
            .disposed(by: bag)
        
        tableView.rx.willDisplayCell
            .subscribe(onNext: { [weak self] cell, indexPath in
                guard let self = self else { return }
                
            })
            .disposed(by: bag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.tableView.deselectRow(at: indexPath, animated: true)
                guard let url = URL(string: self.viewModel.listOfVideos[indexPath.row].videoUrl) else { return }
                self.player.replaceCurrentItem(with: AVPlayerItem(url: url))
                self.player.play()
            }).disposed(by: bag)
    }
    
    func setupPlayer() {
        playerViewController.player = player
        playerViewController.view.frame = CGRect(x: 0, y: 0, width: playerView.bounds.size.width, height: playerView.bounds.size.height)
        playerView.addSubview(playerViewController.view)
        addChild(playerViewController)
    }
}
