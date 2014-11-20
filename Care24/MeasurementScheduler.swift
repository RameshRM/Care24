//
//  MeasurementScheduler.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/16/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation
import HealthKit

public class MeasurementScheduler{
    let measurementsModel:MeasurementsModel = MeasurementsModel();
    let isComplete = false;
    let messenger:Messenger = Messenger();
    
    class var  instance : MeasurementScheduler{
        
        struct MeasurementSchedulerInstance{
            static let instance = MeasurementScheduler();
        }
        return MeasurementSchedulerInstance.instance;
    }
    
    func start() ->Void{
        var measurementSamples:NSDictionary = NSDictionary();
        self.measurementsModel.allMeasurements(MeasurementsDefn.readingList, callback: { (result) -> Void in
            var toAddress = "caregiver@test.com";
            var fromAddress = "jane@test.com";
            self.sendMessage(fromAddress, to: toAddress, message: self.measurementsModel.jsonString(result))
        })
        
    }

    func sendMessage(from:NSString, to: NSString, message: NSString) -> Void{
        self.messenger.send(from, to: to, body: message);
    }
}