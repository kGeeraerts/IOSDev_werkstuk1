//
//  ViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 31/07/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    var VacCents: [VacCent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Voeg vaccinatiecentrum toe"
        // Do any additional setup after loading the view.
        
        if VacCents.isEmpty {
            print("empty")
        }else{
            for vac in VacCents {
                print(vac.naam)
            }
        }
    }
    
    @IBOutlet weak var naam: UITextField!
    @IBOutlet weak var straat: UITextField!
    @IBOutlet weak var huisnummer: UITextField!
    @IBOutlet weak var gemeente: UITextField!
    @IBOutlet weak var Postcode: UITextField!
    @IBOutlet weak var telefoonnummer: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    var picture: UIImage!
    
    func saveImage(image: UIImage, name: String) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(name).png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    @IBAction func addVacCent(_ sender: UIButton) {
        
        if self.naam.text != "" && self.straat.text != "" && self.huisnummer.text != "" && self.gemeente.text != "" && self.Postcode.text != "" && self.telefoonnummer.text != "" && self.latitude.text! != "" && self.longitude.text != "" {
            
            var saved: Bool = false
            
            print(self.naam.text!)
            print(self.straat.text!)
            print(self.huisnummer.text!)
            print(self.gemeente.text!)
            print(self.Postcode.text!)
            print(self.telefoonnummer.text!)
            print(self.latitude.text!)
            print(self.longitude.text!)
            
            if picture != nil {
                if saveImage(image: picture, name: self.telefoonnummer.text!) {
                    saved = true
                }
            }
            
            let newVacCent = VacCent(naam: self.naam.text! ,straat:  self.straat.text! ,huisnummer: Int(self.huisnummer.text!)! ,postcode: Int(self.Postcode.text!)!,gemeente: self.gemeente.text!, lat: Double(self.latitude.text!)!,long: Double(self.longitude.text!)!,telefoonnummer: self.telefoonnummer.text!, saved: saved)
            VacCents.append(newVacCent)
            
        }
        
        print("New VacCent added")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TableViewController
        destination.VacCents = self.VacCents
    }
    
    @IBAction func Addpicture(_ sender: AnyObject) {
        let picture = UIImagePickerController()
        picture.delegate = self
        
        picture.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        picture.allowsEditing = false
        
        print("image requested")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let picture = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.picture = picture
        }
    }
    
    


}

