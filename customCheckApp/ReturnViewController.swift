//
//  ReturnViewController.swift
//  customCheckApp
//
//  Created by 辻大貴 on 2020/06/13.
//  Copyright © 2020 辻大貴. All rights reserved.
//

import UIKit

class ReturnViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //最初の画面に戻る
    @IBAction func backButtonTapped(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
