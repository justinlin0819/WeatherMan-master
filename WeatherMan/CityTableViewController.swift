//
//  CityTableViewController.swift
//  WeatherMan
//
//  Created by Justin Lin on 2018/8/15.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var city: String = ""
        switch indexPath.row {
        case 1:
            city = "臺北市"
        case 2:
            city = "新北市"
        case 3:
            city = "桃園市"
        case 4:
            city = "臺中市"
        case 5:
            city = "臺南市"
        case 6:
            city = "高雄市"
        case 7:
            city = "基隆市"
        case 8:
            city = "新竹縣"
        case 9:
            city = "新竹市"
        case 10:
            city = "苗栗縣"
        case 11:
            city = "彰化縣"
        case 12:
            city = "南投縣"
        case 13:
            city = "雲林縣"
        case 14:
            city = "嘉義縣"
        case 15:
            city = "嘉義市"
        case 16:
            city = "屏東縣"
        case 17:
            city = "宜蘭縣"
        case 18:
            city = "花蓮縣"
        case 19:
            city = "臺東縣"
        case 20:
            city = "澎湖縣"
        case 21:
            city = "金門縣"
        case 22:
            city = "連江縣"
        default:
            break
        }

        if let controller = storyboard?.instantiateViewController(withIdentifier: "weathertableview") as? WeatherTableViewController {
            controller.city = city
            present(controller, animated: true, completion: nil)
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
