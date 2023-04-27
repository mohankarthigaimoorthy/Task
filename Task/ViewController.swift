//
//  ViewController.swift
//  Task
//
//  Created by Mohan K on 18/11/22.
//

import UIKit

struct Section {
    let title: String
    let options : [SettingsOption]
}
struct SettingsOption {
    let title: String
    let mode: String
    let  icon: String
    let tracker: String
    let iconBackgroundColor: UIColor
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
 

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero,style: .grouped)
        table.register(SetupTableViewCell.self,
                       forCellReuseIdentifier: SetupTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight =  100
       
        tableView.frame = view.bounds
    }
    func configure() {
//        self.models = Array(_immutableCocoaArray: 0...15).compactMap( {
//
//            SettingsOption(title: <#T##String#>, mode: <#T##String#>, icon: <#T##String#>, tracker: <#T##String#>, iconBackgroundColor: <#T##UIColor#>, handler: <#T##(() -> Void)##(() -> Void)##() -> Void#>)
//
//
////
//            SettingsOption(title: "Setup", mode: "String", icon: "String", tracker: "", iconBackgroundColor: .systemBlue) {
//
                models.append (Section (title: "general", options: [
            SettingsOption(title:"Swimminglaps,vig (35 min) 9135", mode: "Steps 5000", icon: "self", tracker: "14,135", iconBackgroundColor: .systemPink),
            SettingsOption(title: "Bicycling/Cycling, stationary(30 min) 5430", mode: "", icon: "", tracker: "5430", iconBackgroundColor: .systemPink),
            SettingsOption(title: "Walking, 3.0 mph(30 min) 2790", mode:"Steps5400", icon: "", tracker: "8190", iconBackgroundColor: .systemPink) ,
            SettingsOption(title: "Arm ergometer(30 min) 2250", mode: "Steps6000", icon: "", tracker: "8250", iconBackgroundColor: .systemPink),
            SettingsOption(title: "Backpacking,uphill(120 min) 26520", mode: "Steps 5000", icon: "", tracker: "31,520" , iconBackgroundColor: .systemPink),
            SettingsOption(title: "Steps", mode: "", icon: "", tracker: "8623", iconBackgroundColor: .systemPink) ,
            SettingsOption(title: "Swimming laps,vig(48 min) 12528", mode: "", icon: "", tracker: "12,528", iconBackgroundColor: .systemPink) ,
            SettingsOption(title: "Basketball,shooting(25 min)3000", mode: "Steps 4000", icon: "", tracker: "7000", iconBackgroundColor: .systemPink),
            SettingsOption(title: "Blackpacking, uphill(120min) 26520", mode: "", icon: "", tracker: "26,520", iconBackgroundColor: .systemPink)
                    
                ]   )
                               
                )
            }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models[section].options.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let model = models[indexPath.section].options[indexPath.row]
            
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SetupTableViewCell.identifier, for: indexPath ) as? SetupTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
                     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            tableView.deselectRow(at: indexPath, animated: true)
            let model = models[indexPath.section].options[indexPath.row]
//            model.handler()
        }



    }
