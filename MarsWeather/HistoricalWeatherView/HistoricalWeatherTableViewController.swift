//
//  HistoricalWeatherTableViewController.swift
//  MarsWeather
//
//  Created by K Prenger on 9/5/17.
//  Copyright © 2017 My Tiny Sandbox. All rights reserved.
//

import UIKit

extension Constants {
    struct HistoricalWeather {
        static let loadingCellReuseId = "loadingCell"
        static let weatherCellReuseId = "historicalWeatherCell"
    }
}

class HistoricalWeatherTableViewController: UITableViewController {

    //MARK: - Variables
    
    var expandedArray: [IndexPath] = []
    var weatherArray: [WeatherData]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        
        NetworkUtility.getArchiveWeatherData { [weak self] weatherData in
            self?.weatherArray = weatherData
        }
    }

}

//MARK: - TableView Data Source

extension HistoricalWeatherTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard weatherArray?.count ?? 0 > 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.HistoricalWeather.loadingCellReuseId,
                                                     for: indexPath)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.HistoricalWeather.weatherCellReuseId,
                                                       for: indexPath) as? HistoricalWeatherTableViewCell,
            let weather = weatherArray?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.weather = weather
        cell.moreDetailStack.isHidden = !expandedArray.contains(indexPath)
        return cell
    }
}

//MARK: - TableView Delegate

extension HistoricalWeatherTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = expandedArray.index(of: indexPath) {
            expandedArray.remove(at: index)
        } else {
            expandedArray.append(indexPath)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
