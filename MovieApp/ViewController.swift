//
//  ViewController.swift
//  MovieApp
//
//  Created by Appinventiv on 27/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var labels=["","Latest Movies","","Top Movies","","Amozon Original Series","","Movies in Hindi","","Movies in Telgu","","Comedy Movies",""]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.delegate=self
        self.tableView.dataSource=self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row==0{
            return 180
        }
        else if (indexPath.row % 2 != 0){
            return 50
        }
        else{
            return 160
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0{
            let cell=tableView.dequeueReusableCell(withIdentifier: "MainTitleTableViewCell") as! MainTitleTableViewCell
            
            return cell
        }
        else if (indexPath.row % 2 != 0){
            let cell=tableView.dequeueReusableCell(withIdentifier: "LabelCell") as! LabelTableViewCell
            cell.textLabel!.text=labels[indexPath.row]
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.textAlignment = .left
            
            return cell
        }
            
        else {
            let cell=tableView.dequeueReusableCell(withIdentifier: "MovieImageTableViewCell") as! WatchTableViewCell
            cell.rows = indexPath.row
            return cell
        }
        
    }
}



