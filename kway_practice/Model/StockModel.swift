//
//  StockModel.swift
//  kway_practice
//
//  Created by Eric chung on 2022/6/27.
//

import Foundation

struct StockModel: Codable {
    var data: [Data]
}

struct Data: Codable {
    var code: String
    var name: String
    var per: [String]
    var pbr: [String]
    var riverChartData: [RiverChartData]
//    var currentPer: String
//    var currentPbr: String
//    var medianPer: String
//    var medianPbr: String
//    var estimatedPer: String
//    var estimatedPbr: String
//    var avgPer: String
//    var avgPbr: String
//    var growth: String
    
    enum CodingKeys: String, CodingKey {
        case code = "股票代號"
        case name = "股票名稱"
        case per = "本益比基準"
        case pbr = "本淨比基準"
        case riverChartData = "河流圖資料"
    }
}

struct RiverChartData: Codable {
    var month: String
    var closingPrice: String
    var eps: String
    var per: String
    var strandardPer: [String]
    var bps: String
    var pbr: String
    var standardPbr: [String]
    var avgPer: String?
    var avgPbr: String?
    var growth: String?
    
    enum CodingKeys: String, CodingKey {
        case month = "年月"
        case closingPrice = "月平均收盤價"
        case eps = "近四季EPS"
        case per = "月近四季本益比"
        case strandardPer = "本益比股價基準"
        case bps = "近一季BPS"
        case pbr = "月近一季本淨比"
        case standardPbr = "本淨比股價基準"
        case avgPer = "平均本益比"
        case avgPbr = "平均本淨比"
        case growth = "近3年年複合成長"
    }
    
}
