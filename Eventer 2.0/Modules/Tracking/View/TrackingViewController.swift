//
//  TrackingViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol TrackingViewProtocol: class {
    func proccessBadgePosition(badge: Badge)
}

final class TrackingViewController: UIViewController, ModuleTransitionable {
    
    var presenter: TrackingPresenterProtocol?
    var xValue: CGFloat?
    var yValue = 20
    
    /// single badge for the test
    private var badge: Badge?
    
    private var mapContainer: UIView!
    private var topLeftBase: UIImageView!
    private var topRightBase: UIImageView!
    private var badgeView: UIImageView!
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    private var badgeX: CGFloat!
    private var badgeY: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        evntrSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Private Methods
private extension TrackingViewController {
    
    func evntrSetup() {
        setupMap()
        setupBases()
        setupBadgeView()
    }
    
    func evntLayout(){
        guard let x = getBadgeX(), let y = getBadgeY() else { return }
        badgeView.frame = CGRect(x: 70*x, y: 70*y, width: 20, height: 20)
    }
    
    func setupBadgeView() {
        badgeView = UIImageView(image: UIImage(named: "badge"))
        badgeView.image = badgeView.image?.withRenderingMode(.alwaysTemplate)
        badgeView.tintColor = .red
        mapContainer.addSubview(badgeView)
        badgeView.frame = .zero
    }
    
    func setupMap() {
        mapContainer = UIView()
        mapContainer.backgroundColor = .clear
        mapContainer.layer.borderWidth = 1.0
        mapContainer.layer.borderColor = UIColor.green.cgColor
        view.addSubview(mapContainer)
        mapContainer.frame = CGRect(x: 20, y: 100, width: width - 40, height: height - 300)
    }
    
    func setupBases() {
        topLeftBase = UIImageView(image: UIImage(named: "base"))
        topRightBase = UIImageView(image: UIImage(named: "base"))
        
        mapContainer.addSubview(topLeftBase)
        mapContainer.addSubview(topRightBase)
        
        topLeftBase.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        topRightBase.frame = CGRect(x: mapContainer.frame.width - 24, y: 0, width: 24, height: 24)
    }
    
    func getBadgeX() -> CGFloat? {
        guard let b = self.badge, let xValue = xValue else { return nil }
        let numerator = xValue * xValue + CGFloat(b.distanceTwo) * CGFloat(b.distanceTwo) - CGFloat(b.distanceThree) * CGFloat(b.distanceThree)
        let denominator = 2 * xValue
        return numerator/denominator
    }
    
    func getBadgeY() -> CGFloat? {
        guard let b = self.badge, let x = getBadgeX() else { return nil }
        guard CGFloat(b.distanceTwo) * CGFloat(b.distanceTwo) > x * x else { return nil }
        let result = pow(CGFloat(b.distanceTwo) * CGFloat(b.distanceTwo) - x * x, 0.5)
        return result
    }
    
}

// MARK: - TrackingViewProtocol
extension TrackingViewController: TrackingViewProtocol {
    func proccessBadgePosition(badge: Badge) {
        self.badge = badge
        evntLayout()
    }
}
