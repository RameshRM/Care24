//
//  HomeViewController.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/15/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit
import HealthKit

class HomeViewController: MainViewController {
    let measurements = MeasurementsModel();

    @IBAction func onRefresh(sender: AnyObject) {
        MeasurementScheduler.instance.start();
    }
    
    @IBOutlet weak var refresh: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
