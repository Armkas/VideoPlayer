//
//  Cell.swift
//  VideoPlayer
//
//  Created by user on 2022/03/25.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class Cell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var presenterName: UILabel!
    @IBOutlet weak var videoDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func config(_ model: Video) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.videoTitle.text = model.title
            self.presenterName.text = model.presenterName
            self.videoDescription.text = model.description
            self.thumbnailImageView.kf.setImage(with: URL(string: model.thumbnailUrl))
        }
    }
}
