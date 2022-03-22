//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Quipper Ltd. on 8/27/21.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getData()
        
    }
}

