//
//  EventTableViewController.swift
//  FindABuddy
//
//  Created by Andrii Dremov on 28.11.17.
//  Copyright © 2017 Dremov. All rights reserved.
//

import UIKit
import Firebase

class EventTableViewController: UITableViewController {
    
    //MARK: Properties
    var dbReference: DatabaseReference!
    var events = [Event]()
    
    var eventSnapshots: [DataSnapshot]! = []
    
    var refresh: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load the sample data.
        loadSampleEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            
        }
        
        // Fetches the appropriate meal for the data source layout.
        let event = events[indexPath.row]
        
        cell.nameLabel.text = event.label
        cell.photoImageView.image = event.photo
        cell.descriptionEvent.text = event.description
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: Private Methods
    
    private func incrementEvents(es: [Event]) {
        //        events += [event1, event2, event3]
        events += es
    }
    
    private func loadSampleEvents() {
        
        let photo1 = UIImage(named: "defaultPhoto")
        
        dbReference = Database.database().reference().child("events")//.child("test")
        
        dbReference.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value1 = snapshot.value as? NSDictionary
           
            let eventSnap1 = value1?.value(forKey: "test") as? NSDictionary
            let label1 = eventSnap1?["title"] as? String ?? ""
            let desc1 = eventSnap1?["description"] as? String ?? ""
            let expec1 = eventSnap1?["buddiesNumber"] as? Int ?? 0
            //            let user = User(username: username)
            
            
            guard let event1 = Event(label: label1, photo: photo1, description: desc1, expectedPersons: expec1) else {
                fatalError("Unable to instantiate event1")
            }
            
            let eventSnap2 = value1?.value(forKey: "test2") as? NSDictionary
            let label2 = eventSnap2?["title"] as? String ?? ""
            let desc2 = eventSnap2?["description"] as? String ?? ""
            let expec2 = eventSnap2?["buddiesNumber"] as? Int ?? 0
            
            guard let event2 = Event(label: label2, photo: photo1, description: desc2, expectedPersons: expec2) else {
                fatalError("Unable to instantiate event2")
            }
            
            let eventSnap3 = value1?.value(forKey: "test3") as? NSDictionary
            let label3 = eventSnap3?["title"] as? String ?? ""
            let desc3 = eventSnap3?["description"] as? String ?? ""
            let expec3 = eventSnap3?["buddiesNumber"] as? Int ?? 0
            
            guard let event3 = Event(label: label3, photo: photo1, description: desc3, expectedPersons: expec3) else {
                fatalError("Unable to instantiate event1")
            }
            
            self.incrementEvents(es: [event1, event2, event3])
            self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        print(events)
    }
}

