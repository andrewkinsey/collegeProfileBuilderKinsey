//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Andrew James Kinsey on 2/8/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var myTableView: UITableView!
   
    var myCollegeObject:[CollegeClass] = []
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "Harvard", Location: "Massachuchetes", Enrollment: "22,000", Image: UIImage(named: "harvard")!, WebAdress: URL(string: "https://www.harvard.edu")!, Coordinates: CLLocationCoordinate2D(latitude: 42.376876 , longitude: -71.116531)))
        
        myCollegeObject.append(CollegeClass(Name: "Yale", Location: "Connecticut", Enrollment: "12,400", Image: UIImage(named: "yale")!, WebAdress: URL(string: "https://www.yale.edu")!, Coordinates: CLLocationCoordinate2D(latitude: 41.316002 , longitude: -72.922214)))
        
        myCollegeObject.append(CollegeClass(Name: "Oxford", Location: "United Kingdom", Enrollment: "22,600", Image: UIImage(named: "oxford")!, WebAdress: URL(string: "http://www.ox.ac.uk/")!, Coordinates: CLLocationCoordinate2D(latitude: 51.756422 , longitude: -1.254317)))
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
        alert.addTextField(configurationHandler:
            { (urlTextField) in
                urlTextField.placeholder = "Add College URL Here"
                
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler:
            { (Action) in
                
                if alert.textFields?[0].text == ""
                {
                    let alert = UIAlertController(title: "ERROR", message: "Please Fill in All Text Fields", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    if alert.textFields?[1].text == ""
                    {
                        let alert = UIAlertController(title: "ERROR", message: "Please Fill in All Text Fields", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                    else
                    {
                        if alert.textFields?[2].text == ""
                        {
                            let alert = UIAlertController(title: "ERROR", message: "Please Fill in All Text Fields", preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alert.addAction(cancelAction)
                            self.present(alert, animated: true, completion: nil)
                        }
                        else
                        {
                            
                        let collegeTextField = alert.textFields?[0]
                        let locationTextField = alert.textFields?[1]
                        let urlTextField = alert.textFields?[2]
                            self.myCollegeObject.append(CollegeClass(Name: (collegeTextField?.text)!, Location: (locationTextField?.text)!, Enrollment: "", Image: UIImage(named: "default")!, WebAdress: URL(string: (urlTextField?.text)!)!, Coordinates: CLLocationCoordinate2D()))
                        self.myTableView.reloadData()
                            
                        }
                    }
                }
                
                
            })
        alert.addAction(addAction)
        present(alert, animated: true)
        {
            self.myTableView.reloadData()
        }
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

