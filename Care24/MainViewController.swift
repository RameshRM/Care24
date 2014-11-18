//
//  MainViewController.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/15/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit
import HealthKit

class MainViewController: UIViewController, HealthStoreUser {
    var healthStore: HKHealthStore?;
    var isHealthStoreAuthorized: Bool?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupHealthStore();
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupHealthStore();
    }
    
    
    private func setupHealthStore() {
        if self.healthStore == nil {
            self.healthStore = HKHealthStore()
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        println("View Controller");
//        self.requestAuthorisationForHealthStore();
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    private func requestAuthorisationForHealthStore() {
        self.healthStore?.requestAuthorizationToShareTypes(NSSet(array: MeasurementsDefn.writingList),
            readTypes: NSSet(array: MeasurementsDefn.readingList), completion: {
                (success, error) in
                if success {
                    println("Authorized");
                    self.isHealthStoreAuthorized = true;
                } else {
                    self.isHealthStoreAuthorized = false;
                }
        })
    }
    
}
