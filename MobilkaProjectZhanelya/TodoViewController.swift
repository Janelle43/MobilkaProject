//
//  TodoViewController.swift
//  MobilkaProjectZhanelya
//
//  Created by Zhanelya Irmakhamed on 12/10/20.
//  Copyright © 2020 Zhanelya Irmakhamed. All rights reserved.
//

import UIKit
import RealmSwift

var todos: Results<ToDo>!
var realm = try! Realm()
class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

@IBOutlet weak var todoTableView: UITableView!
override func viewDidLoad() {
super.viewDidLoad()
todos = realm.objects(ToDo.self)
todoTableView.delegate = self
todoTableView.dataSource = self
reload()
}

override func viewWillAppear(_ animated: Bool) {
reload()
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
let todo = todos[indexPath.row]
cell.todoText.text = todo.ToDoText
cell.doneText.text = todo.doneText ? "Done" : "Do it"
return cell

}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return todos.count
}

func reload(){
todoTableView.reloadData()
}
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
if editingStyle == .delete{
try! realm.write{
realm.delete(todos[indexPath.row])
}
reload()
}
}
}

class ToDo: Object {
@objc dynamic var ToDoText = ""
@objc dynamic var doneText = false
}

class ToDoCell: UITableViewCell {
@IBOutlet weak var todoText: UILabel!

@IBOutlet weak var doneText: UILabel!
}
