//
//  MeasurementsModel.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/15/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation
import HealthKit

public class MeasurementsModel : HealthStoreUser {
    var healthStoreCtx: HKHealthStore?;
    var _onQueryComplete: ((result: [AnyObject]!, error: NSError!) -> ())?
    var measurementSamples: [HKQuantitySample]=[]
    var measurements:[HKQuantitySample] = [];

    
    
    init(){
        setupHealthStore();
    }
    
    
    init(healthStoreUser:HKHealthStore){
        self.healthStoreCtx = healthStoreUser;
    }
    
    func query(sampleType: HKSampleType, callback: (result: [AnyObject]!, error: NSError!) -> Void){
        
        _onQueryComplete = callback;
        var sampleQuery = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1,
            sortDescriptors: nil) { (sampleQuery: HKSampleQuery!, result:[AnyObject]!, error: NSError!) -> Void in
                self._onQueryComplete!(result: result, error: error);
        }
        self.healthStoreCtx?.executeQuery(sampleQuery);
    }
    
    func allMeasurements(measuringTypes:[HKQuantityType!], callback: (result: NSDictionary!) -> Void) {
        var count=0;
        
        for item in measuringTypes{
            
            
            self.query(item as HKQuantityType, callback: { (result, error) -> Void in
                count++;
                if(result != nil && result.count > 0){
                    var sample:HKQuantitySample = result[0] as HKQuantitySample;
                    self.onMeasurementReceived(sample);
                }
                if(count == measuringTypes.count){
                    callback(result:self.getMeasurementsBySamplesList(self.measurementSamples));
                }
            })
        }
    }
    
    
    func onMeasurementReceived(quantitySample: HKQuantitySample)-> Void{
        self.measurementSamples.append(quantitySample);
    }
    
    
    func jsonString(measurements: NSDictionary) -> NSString{
        let data = NSJSONSerialization.dataWithJSONObject(measurements, options:NSJSONWritingOptions.allZeros, error: nil);
        let jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding);
        return jsonString!;
    }
    
    
    private func setupHealthStore() {
        if self.healthStoreCtx == nil {
            self.healthStoreCtx = HKHealthStore()
        }
    }
    
    private func getMeasurementsBySamplesList(measurmentSamples:[HKQuantitySample])-> NSDictionary {
        var measurements: NSMutableDictionary = NSMutableDictionary();
        let dateFormat = NSDateFormatter();
        dateFormat.dateFormat = "MM/dd/YYYY hh:mm a";
        for item in measurmentSamples{
            var quantityValue = item.quantity.description as NSString;
            var quantitySampleKvp = ["sampleQuantity" : quantityValue, "metaData" : item.metadata, "createdDt" : dateFormat.stringFromDate(item.startDate)];
            measurements.setValue(quantitySampleKvp, forKey: item.quantityType.description);

        }
        return measurements;
    }
    
}