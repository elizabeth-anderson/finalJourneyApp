//
//  detailViewController.swift
//  Journey
//
//  Created by Elizabeth on 4/19/17.
//  Copyright © 2017 bhs. All rights reserved.
//hello
//maddie

import UIKit

class detailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var myTextView: UITextView!
    
    var diaryDetail:DiaryClass!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationTextField.text = diaryDetail.location
        dateTextField.text = diaryDetail.date
        myTextView.text = diaryDetail.text
        myImageView.image = diaryDetail.image
       
        imagePicker.delegate = self
      
    }
    
    @IBAction func saveButton(_ sender: Any)
    {
        diaryDetail.location = locationTextField.text!
        diaryDetail.image = myImageView.image!
        diaryDetail.text = myTextView.text!
        diaryDetail.date = dateTextField.text!
    }
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
        }
    }
    
    @IBAction func cameraButton(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            getPhotoLibrary()
        }
    }
    
    @IBAction func photoLibraryButton(_ sender: Any)
    {
        getPhotoLibrary()
    }

   

}
