//
//  ViewController.swift
//  MVVMTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private var personViewModel = ViewModel()
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var setProfileButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextfield: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data binding.
        personViewModel.image.bind { image in
            self.profileImg.image = image
        }
        
        personViewModel.name.bind { name in
            self.nameLabel.text = name
        }
        
        personViewModel.age.bind { age in
            self.ageLabel.text = age
        }
    }
    
    // MARK: - @IBAction Properties
    
    // update View Model.
    @IBAction func touchSetProfile(_ sender: UIButton) {
        personViewModel.setImg(to: "person.fill")
    }
    
    @IBAction func touchSetNameButton(_ sender: UIButton) {
        if let name = nameTextfield.text {
            personViewModel.setName(to: name)
        }
    }
    
    @IBAction func touchSetAgeButton(_ sender: UIButton) {
        if let age = ageTextfield.text {
            personViewModel.setAge(to: age)
        }
    }
}

