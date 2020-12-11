//
//  InputViewController.swift
//  MobilkaProjectZhanelya
//
//  Created by Zhanelya Irmakhamed on 12/10/20.
//  Copyright © 2020 Zhanelya Irmakhamed. All rights reserved.
//
import UIKit
import RealmSwift

class InputViewController: UIViewController {

let realm = try! Realm()

@IBAction func saveButtonAction(_ sender: Any) {
let todo = ToDo()
todo.ToDoText = todoTextField.text!
todo.doneText = todoSwitch.isOn

try! realm.write{
realm.add(todo)
}
navigationController?.popViewController(animated: true)
}
@IBOutlet weak var todoSwitch: UISwitch!
@IBOutlet weak var todoTextField: UITextField!
override func viewDidLoad() {
super.viewDidLoad()


}
}
