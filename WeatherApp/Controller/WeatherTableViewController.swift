//
//  WeatherTableViewController.swift
//  WeatherApp
//
//  Created by lakeem muhammad on 1/20/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    var cellViewModels = [WeatherCellVM]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let weatherAPI = WeatherAPIClient()
        let weatherEndpoint =  WeatherEndpoint.tenDayForecast(city: "Columbus", state: "Ohio")
        weatherAPI.weather(with: weatherEndpoint){ (either) in
            switch either {
            case .value(let ForecastText):
                self.cellViewModels = ForecastText.forecastDays.map{
                    WeatherCellVM(url: $0.iconURL, day: $0.day, description: $0.description )
                }
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
                print(ForecastText)
            case .error(let error):
                print (error)
            }
            
        }
        
    }

   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)

        // Configure the cell...
        let cellViewModel = cellViewModels[indexPath.row]
        cell.textLabel?.text = cellViewModel.day
        cell.detailTextLabel?.text = cellViewModel.description
        cellViewModel.loadImage{ (image ) in cell.imageView?.image = image  }

        return cell
    }


}
