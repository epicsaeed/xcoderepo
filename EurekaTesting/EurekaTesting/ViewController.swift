//
//  ViewController.swift
//  EurekaTesting
//
//  Created by Saeed on 08.08.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import ImageRow
import Eureka
import UIKit
import CoreLocation

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        form +++ Section("Listing Details")
            <<< LabelRow(){
                $0.title = "Creator"
                $0.value = "Saeed Alnuaimi"
        }
            +++ Section("Notes")
            <<< TextAreaRow("Notes"){
                $0.tag = "notesRow"
                $0.placeholder = "ex: bring your own water bottles please."
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 50)
            }
            +++ Section("Date and Time")
            <<< DateTimeInlineRow("Starts") {
                $0.tag = "startDateRow"
                $0.title = "Starts"
                $0.value = Date().addingTimeInterval(60*60*24)
            }
            <<< DateTimeInlineRow("Ends") {
                $0.tag = "endDateRow"
                $0.title = "Ends"
                $0.value = Date().addingTimeInterval(60*60*24)
            }
        
            +++ Section("Players Details")
            <<< StepperRow(){
                $0.tag = "playersNeededRow"
                $0.title = "Total players needed"
                $0.value = 6
        }
            <<< SegmentedRow<Int>() {
                $0.tag = "playersOnDeckRow"
                $0.title = "Players on deck per team"
                $0.options = [0,1,2,3,4]
        }
            +++ Section("Location details")
            <<< TextRow(){
                $0.tag = "locationNameRow"
                $0.title = "Location Name"
                $0.placeholder = "Zakher Arena"
        }
            <<< LocationRow(){
                $0.tag = "locationCoordinatesRow"
                $0.title = "Location Coordinates"
                $0.value = CLLocation(latitude: 24.4428, longitude: 54.3757)
        }
            +++ Section()
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Done"
                row.presentationMode = .segueName(segueName: "goToMain", onDismiss: nil)
        }
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: "Done", message: "The listing has been added successfully", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController,animated: true,completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


