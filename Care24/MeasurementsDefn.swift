//
//  MeasurementsDefn.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/15/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation
import HealthKit

public struct MeasurementsDefn {
    
    static let readingList = [
        HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodGlucose),
        HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight),
        HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex),
        HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodAlcoholContent),
        HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierNikeFuel)
    ]
    static let writingList = [
        HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
    ]
    
}