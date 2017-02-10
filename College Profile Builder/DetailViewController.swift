//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Andrew James Kinsey on 2/10/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enrollementTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var detailCollege: CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageView.image = detailCollege.image
        nameTextField.text = detailCollege.name
        locationTextField.text = detailCollege.location
        enrollementTextField.text = detailCollege.enrollment

        
    }

    
}
