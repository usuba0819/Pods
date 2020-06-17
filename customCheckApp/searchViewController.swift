//
//  searchViewController.swift
//  customCheckApp
//
//  Created by 辻大貴 on 2020/06/14.
//  Copyright © 2020 辻大貴. All rights reserved.
//

import UIKit
import Firebase
import Firebase

class searchViewController: UIViewController, UISearchBarDelegate ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var customArray = [allData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchDatas.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        getCustomData()
    }
    //検索バーを定義
    @IBOutlet var searchDatas: UISearchBar!
    
    //検索ボタンを押した時に読み込むコード
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //キーボードを閉じる
        view.endEditing(true)
        //Debug用コード
        if let searchWord = searchBar.text {
        print(searchWord)
    }
  }
    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //顧客データを取得する
    func getCustomData() {
        let dataRef = Database.database().reference().child("user")
        
        dataRef.queryOrdered(byChild: "name").observeSingleEvent(of: .value, with: {(snapshot) in
            for item2 in snapshot.children {
                let snap2 = item2 as! DataSnapshot
                let dict2 = snap2.value as! [String: Any]
                let name = dict2["name"] as? String
                //取得したdict2のデータをプリント
                print(dict2 as Any)
                let custom = allData(name: name)
                self.customArray.append(custom)
            }
            self.tableView.reloadData()
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //データの数だけ作る
        return customArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let CustomArray = customArray[indexPath.row]
        cell.textLabel?.text = CustomArray.name
        
        return cell
    }

}   //class
