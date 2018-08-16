//
//  CityTableViewController.swift
//  WeatherMan
//
//  Created by Justin Lin on 2018/8/15.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    @IBOutlet var button_city: [UIButton]!
    var date = [String]()
    var weather = [String]()
    var city: String = ""
    
    @IBAction func button_cityselection(_ sender: UIButton) {
        switch sender {
        case button_city[0]:
            city = "臺北市"
        case button_city[1]:
            city = "新北市"
        case button_city[2]:
            city = "桃園市"
        case button_city[3]:
            city = "臺中市"
        case button_city[4]:
            city = "臺南市"
        case button_city[5]:
            city = "高雄市"
        case button_city[6]:
            city = "基隆市"
        case button_city[7]:
            city = "新竹縣"
        case button_city[8]:
            city = "新竹市"
        case button_city[9]:
            city = "苗栗縣"
        case button_city[10]:
            city = "彰化縣"
        case button_city[11]:
            city = "南投縣"
        case button_city[12]:
            city = "雲林縣"
        case button_city[13]:
            city = "嘉義縣"
        case button_city[14]:
            city = "嘉義市"
        case button_city[15]:
            city = "屏東縣"
        case button_city[16]:
            city = "宜蘭縣"
        case button_city[17]:
            city = "花蓮縣"
        case button_city[18]:
            city = "臺東縣"
        case button_city[19]:
            city = "澎湖縣"
        case button_city[20]:
            city = "金門縣"
        case button_city[21]:
            city = "連江縣"
        default:
            break
        }
        let urlStr = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=e6831708-02b4-4ef8-98fa-4b4ce53459d9"
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data, let dic = try?
                    
                    JSONSerialization.jsonObject(with: data) as? [String: Any], let result1 = dic?["result"] as? [String: Any], let result2 = result1["results"] as? [[String: Any]]{
                    for location in result2 {
                        let id = location["_id"] as! String
                        let city_t = location["locationName"] as! String
                        let weather_t = location["parameterName1"] as! String
                        if (Int(id)! % 2 == 0) && city_t == self.city {
                            let date_t = location["startTime"] as! String
                            self.date.append(String(date_t.prefix(10)))
                        self.weather.append(String(weather_t))
                    }
                }
                }
            
            }
            task.resume()
        }
        
        while self.date.count != 7 {
            
        }
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "weathertableview") as? WeatherTableViewController {
            for i in 0...6 {
                controller.date.append(self.date[i])
                controller.weather.append(self.weather[i])
            }
            present(controller, animated: true, completion: nil)
        }
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


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
