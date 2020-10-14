//
//  DetailEvents.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 31.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol DetailEventsViewProtocol: class {
    func configure(with event: Event)
    func showAlert(title: String, text: String, completion: ((UIAlertAction)->Void)?)
}

class DetailEvents: UIViewController, ModuleTransitionable, DetailEventsViewProtocol {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBAction func deleteTapped(_ sender: Any) {
        showAnswerAlert(title: "Warning", text: "Do you really want to remove this event?", completion: { [weak self] _ in self?.presenter?.onDelete?() })
    }
    
    var presenter: DetailEventsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewloaded()
    }
    
    fileprivate func setupNavBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.87964499, green: 0.8826124072, blue: 0.873254478, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func configure(with event: Event) {
        nameLabel.text = event.name
        dateLabel.text = event.date
        startTimeLabel.text = event.startTime
        roomLabel.text = event.room
    }
    
    func showAlert(title: String, text: String, completion: ((UIAlertAction)->Void)?) {
        let lert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        lert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: completion ?? {_ in self.dismiss(animated: true, completion: nil)}))
        present(lert, animated: true, completion: nil)
    }
    
    func showAnswerAlert(title: String, text: String, completion: ((UIAlertAction)->Void)?) {
        let lert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        lert.addAction(UIAlertAction(title: "Yes", style: .default, handler: completion!))
        lert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {_ in self.dismiss(animated: true, completion: nil)}))
        present(lert, animated: true, completion: nil)
    }

}
