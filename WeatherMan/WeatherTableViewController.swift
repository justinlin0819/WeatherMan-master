//
//  WeatherTableViewController.swift
//  WeatherMan
//
//  Created by Justin Lin on 2018/8/15.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    @IBOutlet weak var label_city: UILabel!
    @IBOutlet var label_date: [UILabel]!
    @IBOutlet var image_weather: [UIImageView]!
    @IBOutlet var label_temph: [UILabel]!
    @IBOutlet var label_templ: [UILabel]!
    
    var Final_Result: [Results] = []
    var city: String = ""
    var date = [Date]()
    var weather = [String]()
    var temperature_h = [String]()
    var temperature_l = [String]()
    
    @IBAction func button_backhome(_ sender: Any) {
        Final_Result = []
        date = [Date]()
        weather = [String]()
        temperature_h = [String]()
        temperature_l = [String]()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlStr = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=e6831708-02b4-4ef8-98fa-4b4ce53459d9"
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data, let weather = try? decoder.decode(Weather.self, from: data) {
                    self.Final_Result = weather.result.results
                }
            }
            task.resume()
        }
        
        label_city.text = self.city
        
        while self.Final_Result.count != 308 {
            
        }
        
        for i in 0...307 {
            if (Int(self.Final_Result[i]._id)! % 2 == 0) && self.Final_Result[i].locationName == self.city {
                date.append(self.Final_Result[i].startTime)
                weather.append(self.Final_Result[i].parameterName1)
                temperature_h.append(self.Final_Result[i].parameterName2)
                temperature_l.append(self.Final_Result[i].parameterName3)
            }
        }
        
        for i in 0...6 {
            let weekday = Calendar.current.component(.weekday, from: self.date[i])
            switch weekday {
            case 1:
                label_date[i].text = "星期日"
            case 2:
                label_date[i].text = "星期一"
            case 3:
                label_date[i].text = "星期二"
            case 4:
                label_date[i].text = "星期三"
            case 5:
                label_date[i].text = "星期四"
            case 6:
                label_date[i].text = "星期五"
            case 7:
                label_date[i].text = "星期六"
            default:
                break
            }
            label_temph[i].text = self.temperature_h[i]
            label_templ[i].text = self.temperature_l[i]
            switch self.weather[i] {
            case "多雲時陰短暫陣雨或雷雨":
                image_weather[i].image = UIImage(named: "多雲時陰短暫陣雨或雷雨")
            case "陰時多雲短暫陣雨或雷雨":
                image_weather[i].image = UIImage(named: "多雲時陰短暫陣雨或雷雨")
            case "陰時多雲":
                image_weather[i].image = UIImage(named: "陰時多雲")
            case "多雲":
                image_weather[i].image = UIImage(named: "多雲")
            case "陰陣雨或雷雨":
                image_weather[i].image = UIImage(named: "雷雨")
            default:
                image_weather[i].image = UIImage(named: "晴")
            }
        }
        
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
