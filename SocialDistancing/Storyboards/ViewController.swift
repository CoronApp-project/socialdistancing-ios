//
//  ViewController.swift
//  SocialDistancing
//
//  Created by AndreaRov on 02/04/2020.
//

import UIKit
import UserNotifications
import CoreBluetooth

final class ViewController: UIViewController, CBCentralManagerDelegate {
    
    var centralManager: CBCentralManager!
    let center = UNUserNotificationCenter.current()
    
    private let alert = UIAlertController(title: "⚠️ Attention!", message: "You are too close to another person. Move away until you see this alert disappear", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        
        // Request permission to display alerts and play sounds.
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case .unknown:
            debugPrint("central.state is .unknown")
        case .resetting:
            debugPrint("central.state is .resetting")
        case .unsupported:
            debugPrint("central.state is .unsupported")
        case .unauthorized:
            debugPrint("central.state is .unauthorized")
        case .poweredOff:
            debugPrint("central.state is .poweredOff")
        case .poweredOn:
            debugPrint("central.state is .poweredOn")
            centralManager.scanForPeripherals(withServices: nil)
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String: Any],
                        rssi RSSI: NSNumber) {
        
       
        
        if RSSI.intValue >= -70, self.presentedViewController == nil {
            
            debugPrint(peripheral, RSSI)
            
            self.sendNotification()
            

            self.present(alert, animated: true) {

                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    self.alert.dismiss(animated: true, completion: nil)
                }
            }
            
            
            
        }
    }
    
    func sendNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "⚠️ Attention!"
        content.body = "You are too close to another person. Keep the social distancing"
        content.categoryIdentifier = "UYLReminderCategory"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60.0, repeats: true)
        
        let request = UNNotificationRequest(identifier: "Distancing", content: content, trigger: trigger)
        
        center.add(request)
        
        
    }
    
    
}
