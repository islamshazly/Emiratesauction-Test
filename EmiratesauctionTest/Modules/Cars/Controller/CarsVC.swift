//
//  CarsVC.swift
//  EmiratesauctionTest
//
//  Created by Islam Elshazly on 7/7/18.
//  Copyright © 2018 Islam Elshazly. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout


final class CarsVC: BaseViewController {
    
    // MARK: -  variables
    var carsObj: CarsModel = CarsModel()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(CarsVC.refreshControll),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    var timer: Timer?
    
    // MARK: - outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var gridViewButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsObj = CarsModel(delegate: self)
        collectionView.dataSource = self
        
        requestCars()
        collectionView.addSubview(refreshControl)
        self.collectionView.alwaysBounceVertical = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        headerView.createGradientLayer(isVertical: true)
        filterView.roundedShadow()
        gridViewButton.roundCorners([.layerMaxXMaxYCorner , .layerMaxXMinYCorner], radius: 5.0)
        filterButton.roundCorners([.layerMinXMaxYCorner , .layerMinXMinYCorner], radius: 5.0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer?.invalidate()
    }
    
    // MARK: - Helping Methods
    
    func autoRefresh(xSeconds: Double) {
        let xMinte = xSeconds * 60
        timer = Timer.scheduledTimer(timeInterval: xMinte, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        requestCars()
        
    }
    
    // MARK: - ApiCalls
    
    @objc func refreshControll() {
        requestCars()
        
    }
    
    func requestCars() {
        
        showLoadingIndicator()
        carsObj.requestCars(withSuccessClouser: { [weak self](model) in
            if let obj = model as? CarsModel {
                self?.carsObj = obj
                self?.collectionView.reloadData()
                self?.timer?.invalidate()
                self?.autoRefresh(xSeconds: obj.RefreshInterval)
            }
            self?.refreshControl.endRefreshing()
        }) { [weak self] (_) in
            self?.refreshControl.endRefreshing()
            // already handled error by faliure delegate at BaseViewController
            // make additonal code if you want
        }
    }
    
    // MARK: - Actions
    
    @IBAction func changeLanguageAction(_ sender: Any) {
        
        LaguageActionSheet()
    }
    
    @IBAction func sortAction(_ sender: Any) {
        sortOptions()
    }
    
    // MARK: - Helping methods
    
    func sortOptions() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let endDateSort = UIAlertAction(title: "End_Date".localized, style: .default, handler: {  [weak self](action) -> Void in
            self?.carsObj.sortDescByEndDate()
            self?.collectionView.reloadData()
        })
        let  yearSort = UIAlertAction(title: "Year".localized, style: .default, handler: { [weak self](action) -> Void in
            self?.carsObj.sortDescByYear()
            self?.collectionView.reloadData()
        })
        
        let  priceSort = UIAlertAction(title: "Price".localized, style: .default, handler: {[weak self] (action) -> Void in
            self?.carsObj.sortDescByPrice()
            self?.collectionView.reloadData()
        })
        
        let cancelButton = UIAlertAction(title: "cancel".localized, style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        alertController.addAction(endDateSort)
        alertController.addAction(priceSort)
        alertController.addAction(yearSort)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func LaguageActionSheet() {
        
        let alertController = UIAlertController(title: "Change_Lang_warrning".localized, message: nil, preferredStyle: .actionSheet)
        
        let englsihButton = UIAlertAction(title: "language_option_english".localized, style: .default, handler: {  (action) -> Void in
            if Language.language == .arabic {
                Language.language = .english
                    UIViewController.gotoRoot()
            }
        })
        let  arabicButton = UIAlertAction(title: "language_option_arabic".localized, style: .default, handler: { (action) -> Void in
            
            if Language.language == .english {
                Language.language = .arabic
                    UIViewController.gotoRoot()
            }
        })
        
        let cancelButton = UIAlertAction(title: "cancel".localized, style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        alertController.addAction(englsihButton)
        alertController.addAction(arabicButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension CarsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsObj.cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as? UICollectionViewCell {
            
            if let carView = cell.viewWithTag(1) as? CarView {
                if carsObj.cars.count > 0 {
                    
                    let carModel = carsObj.cars[indexPath.row]
                    carView.configure(car: carModel)
                }
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
}

