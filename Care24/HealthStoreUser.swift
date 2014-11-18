//
//  HealthStoreUser.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/15/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import Foundation
import HealthKit

@objc protocol HealthStoreUser {
    optional var healthStore: HKHealthStore? { get set }
    optional var healthStoreCtx: HKHealthStore? { get set }
}