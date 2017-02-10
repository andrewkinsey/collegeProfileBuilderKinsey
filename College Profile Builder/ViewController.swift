//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Andrew James Kinsey on 2/8/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var myTableView: UITableView!
   
    var myCollegeObject:[CollegeClass] = []
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "Harvard", Location: "Massachuchetes", Enrollment: "22,000", Image: UIImage(named: "harvard")!))
        myCollegeObject.append(CollegeClass(Name: "Yale", Location: "Connecticut", Enrollment: "12,400", Image: UIImage(named: "yale")!))
        myCollegeObject.append(CollegeClass(Name: "Oxford", Location: "United Kingdom", Enrollment: "22,600", Image: UIImage(named: "oxford")!
        
        ))
    }

    
    
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler:
            { (collegeTextField) in
                collegeTextField.placeholder = "Add College Here"
            
            })
        
        alert.addTextField(configurationHandler:
            { (locationTextField) in
                locationTextField.placeholder = "Add College Location Here"
            })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler:
            { (Action) in
                let collegeTextField = alert.textFields?[0]
                let locationTextField = alert.textFields?[1]
                self.myCollegeObject.append(CollegeClass(Name: (collegeTextField?.text)!, Location: (locationTextField?.text)!))
                self.myTableView.reloadData()
            })
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].location
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.detailCollege = myCollegeObject[selectedRow!]
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }
}

