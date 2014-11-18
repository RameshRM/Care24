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
    
    class var  instance : MeasurementScheduler{
        
        struct MeasurementSchedulerInstance{
            static let instance = MeasurementScheduler();
        }
        return MeasurementSchedulerInstance.instance;
    }
    
    func start() ->Void{
        var measurementSamples:NSDictionary = NSDictionary();
        self.measurementsModel.allMeasurements(MeasurementsDefn.readingList, callback: { (result) -> Void in
            println(self.measurementsModel.jsonString(result));
        })
        
    }
    
    
    
    
    
}