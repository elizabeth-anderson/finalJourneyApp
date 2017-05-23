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
    
    var myDiaryObject : [DiaryClass] = []
    
    
    
    override func viewDidLoad()
        
        //self.view.backgroundColor = UIColor(skyBackground:#imageLiteral(resourceName: "background"))
       
    {
        super.viewDidLoad()
        myDiaryObject.append(DiaryClass(Location: "Florida", Date: "December 2017", Text: "florida was fun.", Image:UIImage(named: "florida")!))
        myDiaryObject.append(DiaryClass(Location: "Indiana", Date: "October 8, 2015", Text: "i love indiana", Image: UIImage(named: "indiana")!))
        
        
        
         let backgroundImage = #imageLiteral(resourceName: "skyBackground")
        let imageView = UIImageView(image: backgroundImage)
        self.myTableView.backgroundView = imageView
    }
    
    
    func getDiaryObject() -> [DiaryClass]
    {
        return myDiaryObject
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
            
            
            self.myDiaryObject.append(DiaryClass(Location: (locationTextField?.text)!, Date: (dateTextField?.text)!))
            
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
        cell.imageView?.image = myDiaryObject[indexPath.row].image
        
        
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
        if segue.identifier == "infoSegue"
            
        {
            let detailView = segue.destination as! detailViewController
            
            let selectedRow = myTableView.indexPathForSelectedRow?.row
            
            
            detailView.diaryDetail = myDiaryObject[selectedRow!]
        }
        else if segue.identifier == "mapSegue"
        {
            //let mapViewController = segue.destination as! MapViewController
            let mapViewController = segue.destination as! MapViewController
            
            //let vc = self.storyboard?.instantiateViewController(withIdentifier: "mapSegue") as! MapViewController
            
            mapViewController.myDiaryObjectMap = myDiaryObject
            //vc.myDiaryObjectMap = self.myDiaryObject
            
            //self.present(vc, animated: true, completion: nil)
            
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }
    
    
        override func viewWillAppear(_ animated: Bool)
        {
            //self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
            
            
            // Add background view to the table view
            let backgroundImage = UIImage(named: "skyBackground")
            let imageView = UIImageView(image: backgroundImage)
            self.myTableView.backgroundView = imageView
            /////////////////////////////////////
            //[NSUserDefaults standardDefaults]
            //NSString *theText = [textDef stringForKey:"entry"
            //NSInteger myInt
            //tableView.text = theText
    }
//    override func viewWillDisappear(_ animated: Bool)
//    {
//        NSString myTableView = myTableView.text
//        [[NSUserDefaults standardUserDefaults] setObject:myTableView  forKey: "entry"]
//            
//        
//    }
    
}

