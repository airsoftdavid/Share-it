//
//  ContactsViewController.swift
//  Share-IT4
//
//  Created by David Chen on 5/8/15.
//  Copyright (c) 2015 David Chen. All rights reserved.
//

import UIKit
import AddressBookUI

class ContactsTableViewController: UIViewController, ABPeoplePickerNavigationControllerDelegate {
    
    @IBAction func perfomPickPerson(sender: UIButton) {
        self.presentViewController(personPicker, animated: true, completion: nil)
    }

    
    let personPicker: ABPeoplePickerNavigationController
    
    required init(coder aDecoder: NSCoder) {
        personPicker = ABPeoplePickerNavigationController()
        super.init(coder: aDecoder)
        personPicker.peoplePickerDelegate = self
    }
    
    func peoplePickerNavigationControllerDidCancel(
        peoplePicker: ABPeoplePickerNavigationController!){
            /* Mandatory to implement */
    }
    
    func peoplePickerNavigationController(
        peoplePicker: ABPeoplePickerNavigationController!,
        didSelectPerson person: ABRecordRef!,
        property: ABPropertyID,
        identifier: ABMultiValueIdentifier){
            
            /* A property in a person was picked */
            
    }
    
    func peoplePickerNavigationController(
        peoplePicker: ABPeoplePickerNavigationController!,
        didSelectPerson person: ABRecordRef!) {
            
            /* Do we know which picker this is? */
            if peoplePicker != personPicker{
                return
            }
            
            /* Get all the phone numbers this user has */
            
            let phones: ABMultiValueRef = ABRecordCopyValue(person,
                kABPersonPhoneProperty).takeRetainedValue()
            
            let firstName = ABRecordCopyValue(person,
                kABPersonFirstNameProperty).takeRetainedValue() as! String
            
            let lastName = ABRecordCopyValue(person,
                kABPersonLastNameProperty).takeRetainedValue() as! String
            
            let countOfPhones = ABMultiValueGetCount(phones)
            
            for index in 0..<countOfPhones{
                let phone = ABMultiValueCopyValueAtIndex(phones,
                    index).takeRetainedValue() as! String
                
                println(phone)
                
            }
            println(firstName, lastName)
            
            roomsList.append(Room(vtitle: "Default", vid: 000402, vuserlist: [User(fName: firstName, lName: lastName, identification: 3)]))
            
    }
    
    
}
