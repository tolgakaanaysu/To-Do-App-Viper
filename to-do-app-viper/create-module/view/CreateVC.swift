//
//  CreateVC.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 26.08.2022.
//

import UIKit

class CreateVC: UIViewController {
    
    @IBOutlet var addTextField: UITextField!
    var createPresenter: ViewToPresenterCreateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextFieldConfigure()
        CreateRouter.createModule(ref: self)
    }
    
    @IBAction func createButton(_ sender: Any) {
        createPresenter?.create(text: addTextField.text ?? "N/A")
        navigationController?.popToRootViewController(animated: true)

    }
    
    func addTextFieldConfigure(){
        addTextField.textColor = .white
        addTextField.backgroundColor = .black
        addTextField.tintColor = .white
        addTextField.clearButtonMode = .always
        addTextField.layer.cornerRadius = 3.0
        addTextField.layer.borderWidth = 1
        addTextField.layer.borderColor = UIColor.white.cgColor
        addTextField.layer.masksToBounds = true
        addTextField.attributedPlaceholder = NSAttributedString(
            string: "Add Note",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
    }
}
