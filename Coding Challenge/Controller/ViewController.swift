//
//  ViewController.swift
//  Coding Challenge
//
//  Created by Eric Barnes on 9/10/20.
//  Copyright © 2020 Eric Barnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var mockHeaderData = [
        "Beer No Pong 😎",
        "Oh Yeahh",
        "Partayy 😎"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupTableView()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.barTintColor = .black
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.register(CollectionRowTableViewCell.self, forCellReuseIdentifier: "collectionTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        mockHeaderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "collectionTableViewCell", for: indexPath) as! CollectionRowTableViewCell
        let mockDataModel = mockHeaderData[Int.random(in: 0...2)]
        cell.configure(for: mockDataModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}

