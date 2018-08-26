//
//  Weather.swift
//  WeatherMan
//
//  Created by Justin Lin on 2018/8/26.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import Foundation

struct Results: Codable {
    var _id: String
    var locationName: String
    var startTime: Date
    var parameterName1: String
    var parameterName2: String
    var parameterName3: String
}

struct WeatherResult: Codable {
    var results: [Results]
}

struct Weather: Codable {
    var result: WeatherResult
}

