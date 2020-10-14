//
//  EventsViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol EventsViewProtocol: class {
    func update()
}

class EventsViewController: UIViewController, ModuleTransitionable {

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
        update()
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
        cell.configure(title: data.name, data: data.date, startTime: data.startTime, endTime: data.endTime, roomNumbber: String(describing: data.room.roomNumber))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let event = presenter?.cellData?[indexPath.row] else { return }
        presenter?.onEvent?(event)
    }
    
}


extension EventsViewController: EventsViewProtocol {
    func update() {
        tableVIew.reloadData()
    }
}
