//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Andrew James Kinsey on 2/10/17.
//  Copyright © 2017 The Cabinents. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enrollementTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var webAdressTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    var detailCollege: CollegeClass!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        imageView.image = detailCollege.image
        nameTextField.text = detailCollege.name
        locationTextField.text = detailCollege.location
        enrollementTextField.text = detailCollege.enrollment
        webAdressTextField.text = detailCollege.webAdress?.absoluteString
        latitudeTextField.text = String(detailCollege.coordinates.latitude)
        longitudeTextField.text = String(detailCollege.coordinates.longitude)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        resignFirstResponder()
        detailCollege.name = nameTextField.text!
        detailCollege.image = imageView.image
        detailCollege.location = locationTextField.text!
        detailCollege.enrollment = enrollementTextField.text!
        detailCollege.webAdress = URL(string: webAdressTextField.text!)
        resignFirstResponder()
    }

    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func visitWebsiteButton(_ sender: Any)
    {
        let svc = SFSafariViewController(url: URL(string: webAdressTextField.text!)!)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func changeImageButtonTapped(_ srender: Any)
    {
        getPhotoLibrary()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true, completion:
        {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = selectedImage
        })
       
    }
    
    @IBAction func tapGesture(_ sender: Any)
    {
        resignFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let mapView = segue.destination as! MapViewController
        mapView.mapCollegeClass = detailCollege
    }


}
