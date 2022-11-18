//
//  ViewController.swift
//  Shaadi
//
//  Created by Saravana on 18/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeListTableView: UITableView!
    
    
    // MARK: - Properties
    var presenter: ShaadiViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateView()
        swipeListTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        swipeListTableView.delegate = self
        swipeListTableView.dataSource = self
    }
    
}

// MARK: DataSource&Delegates

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = swipeListTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        let row = indexPath.row
        let userData = presenter?.getList(index: row)
        if let userDetails = userData {
            cell.setUserList(details: userDetails)
        } else {
            cell.setUserList(details: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

// MARK: - ShaadiPresenterToViewProtocol
extension ViewController: ShaadiPresenterToViewProtocol {
    func showNews() {
        swipeListTableView.reloadData()
    }
}

