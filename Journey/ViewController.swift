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
    
    //self.view.backgroundColor = UIColor(patternImage:#imageLiteral(resourceName: "background"))
    {
        super.viewDidLoad()
        myDiaryObject.append(diaryClass(Location: "Florida", Date: "December 2017", Text: "florida was fun.", Image:UIImage(named: "florida")!))
        myDiaryObject.append(diaryClass(Location: "Indiana", Date: "October 8, 2015", Text: "i love indiana", Image: UIImage(named: "indiana")!))
        
    }

    @IBAction func addButtonTapped(_ sender: Any)
    {
    
            let alert = UIAlertController(title: "add trip", message: nil, preferredStyle: .alert)
            
            alert.addTextField
            {
                    (locationTextField) in locationTextField.placeholder = "add location"
            }
        
            alert.addTextField
                {
                    (dateTextField) in dateTextField.placeholder = "add date"
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            
            let addAction = UIAlertAction(title: "Add", style: .default)
            {
                (action) in
                
                let locationTextField = alert.textFields?[0]
                
                let dateTextField = alert.textFields?[1]
                
                
                self.myDiaryObject.append(diaryClass(Location: (locationTextField?.text)!, Date: (dateTextField?.text)!))
                
                self.myTableView.reloadData()
            }
            
            alert.addAction(addAction)
            
            present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myDiaryObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)
        
        cell.textLabel?.text = myDiaryObject[indexPath.row].location
        
        cell.detailTextLabel?.text = myDiaryObject[indexPath.row].date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            myDiaryObject.remove(at: indexPath.row)
            
            myTableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! detailViewController
        
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.diaryDetail = myDiaryObject[selectedRow!]
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }

 


}

