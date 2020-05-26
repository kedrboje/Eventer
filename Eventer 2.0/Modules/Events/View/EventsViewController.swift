//
//  EventsViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol EventsViewProtocol: class {
    
}

class EventsViewController: UIViewController, ModuleTransitionable , EventsViewProtocol {

    @IBOutlet weak var tableVIew: UITableView!
    var presenter: EventsPresenterProtocol?
    fileprivate var cellIdentifier = "EventCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    fileprivate func setupViews() {
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.cellData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! EventCell
        guard let data = presenter?.cellData?[indexPath.row] else { return UITableViewCell() }
        cell.configure(title: data.title, data: data.data, time: data.time, room: data.room)
        return cell
    }
    
    
}
