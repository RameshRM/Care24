//
//  Messenger.swift
//  Care24
//
//  Created by Mahadevan, Ramesh on 11/18/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//
import UIKit
import Foundation
import HealthKit

public class Messenger{
    let messagePOBox: NSString = "";
    let fromAddress:NSString = UIDevice.currentDevice().identifierForVendor.UUIDString ;
    let toAddres:NSString = "";
    
    init(){
        let path = NSBundle.mainBundle().bundlePath + "/Care24Config.pList"
        let pListData = NSDictionary(contentsOfFile:path)
        if(pListData != nil){
            messagePOBox = pListData?.valueForKey("Message Box Id") as NSString;
            fromAddress = pListData?.valueForKey("Message From") as NSString;
            
            
        }
    }
    
    func send(to: NSString, body: NSString) -> Void{
        var bodyParam = ("\"\(body)\"")
        var urlString:NSString = ("\(messagePOBox)?from=\(fromAddress)&to=\(to)&body=\(bodyParam)");
        var encodedUrlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
        if var url = NSURL(string: encodedUrlString!){
            var request = NSURLRequest(URL: url);
            NSURLConnection.sendAsynchronousRequest(request,queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            }
        }
    }

    func send(from: NSString, to:NSString, body: NSString) -> Void{
        var bodyParam = ("\"\(body)\"")
        var urlString:NSString = ("\(messagePOBox)?from=\(from)&to=\(to)&body=\(bodyParam)");
        var encodedUrlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
        if var url = NSURL(string: encodedUrlString!){
            var request = NSURLRequest(URL: url);
            NSURLConnection.sendAsynchronousRequest(request,queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            }
        }
    }

}
