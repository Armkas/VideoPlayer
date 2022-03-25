//
//  Cell.swift
//  VideoPlayer
//
//  Created by user on 2022/03/25.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var presenterName: UILabel!
    @IBOutlet weak var videoDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoDescription.isScrollEnabled = false
        videoDescription.isEditable = false
    }

    func config(_ model: Video) {
        videoTitle.text = model.title
        presenterName.text = model.presenterName
        videoDescription.text = model.description
        guard let imageData = try? Data(contentsOf: URL(fileURLWithPath: model.thumbnailUrl)),
              let image = UIImage(data: imageData) else { return }
        thumbnailImageView.image = image
    }
}
