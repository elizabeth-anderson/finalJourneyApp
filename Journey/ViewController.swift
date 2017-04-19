//
//  ViewController.swift
//  Journey
//
//  Created by Student on 4/17/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var myDiaryObject : [diaryClass] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myDiaryObject.append(diaryClass(Location: "Florida", Date: "December 2016"))
         myDiaryObject.append(diaryClass(Location: "Indiana", Date: "February 2017"))
        
    }

    @IBAction func addButtonTapped(_ sender: Any)
    {
    
            let alert = UIAlertController(title: "add trip", message: nil, preferredStyle: .alert)
            
            alert.addTextField
                {
                    (collegeTextField) in collegeTextField.placeholder = "add college"
            }
            
            alert.addTextField
                {
                    (locationTextField) in locationTextField.placeholder = "add location"
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            
            let addAction = UIAlertAction(title: "Add", style: .default)
            {
                (action) in
                
                let collegeTextField = alert.textFields?[0]
                
                let locationTextField = alert.textFields?[1]
                
                
                self.myCollegeObject.append(collegeClass(Name: (collegeTextField?.text)!, Location: (locationTextField?.text)!))
                
                self.myTableView.reloadData()
            }
            
            alert.addAction(addAction)
            
            present(alert, animated: true, completion: nil)
            
        }

 


}

