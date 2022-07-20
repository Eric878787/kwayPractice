//
//  ViewController.swift
//  kway_practice
//
//  Created by Eric chung on 2022/6/26.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    private let stockProvider = StockProvider()
    
    private var stock: StockModel?
    
    private var selectedX: Int = 11
    
    private var months: [String] = []
    
    private var price: [Double] = []
    
    private var StandardPer1: [Double] = []
    
    private var StandardPer2: [Double] = []
    
    private var StandardPer3: [Double] = []
    
    private var StandardPer4: [Double] = []
    
    private var StandardPer5: [Double] = []
    
    private var StandardPer6: [Double] = []
    
    private var colors: [UIColor] = [
        UIColor(rgb: 0xfe8988),
        UIColor(rgb: 0xffb782),
        UIColor(rgb: 0xffddbb),
        UIColor(rgb: 0xc9dfff),
        UIColor(rgb: 0x749bdd),
        UIColor(rgb: 0x29959a),
        UIColor(rgb: 0xed1f12),
    ]
    
    @IBOutlet weak var chartView: CombinedChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.xAxis.valueFormatter = self
        chartView.delegate = self
        chartView.legend.textColor = .white
        chartView.legend.horizontalAlignment = .center
        chartView.legend.verticalAlignment = .top
        chartView.legend.xEntrySpace = 20
        chartView.legend.yEntrySpace = 10
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.labelPosition = .bottom
        chartView.rightAxis.labelTextColor = .white
        stockProvider.getData { stockModel in
            self.stock = stockModel
            
            for i in 0..<12 {
                self.months.append(self.stock!.data[0].riverChartData[i].month)
            }
            self.months.reverse()
            
            for i in 0..<12 {
                self.price.append(Double(self.stock!.data[0].riverChartData[i].closingPrice)!)
            }
            self.price.reverse()
            
            for i in 0..<12 {
                self.StandardPer1.append(Double(self.stock!.data[0].riverChartData[i].strandardPer[5])!)
            }
            self.StandardPer1.reverse()
            
            for i in 0..<12 {
                self.StandardPer2.append(Double(self.stock!.data[0].riverChartData[i].strandardPer[4])!)
            }
            self.StandardPer2.reverse()
            
            for i in 0..<12 {
                self.StandardPer3.append(Double(self.stock!.data[0].riverChartData[i].strandardPer[3])!)
            }
            self.StandardPer3.reverse()
            
            for i in 0..<12 {
                self.StandardPer4.append(Double(self.stock!.data[0].riverChartData[i].strandardPer[2])!)
            }
            self.StandardPer4.reverse()
            
            for i in 0..<12 {
                self.StandardPer5.append(Double(self.stock!.data[0].riverChartData[i].strandardPer[1])!)
            }
            self.StandardPer5.reverse()
            
            for i in 0..<12 {
                self.StandardPer6.append(Double(self.stock!.data[0].riverChartData[i].strandardPer[0])!)
            }
            self.StandardPer6.reverse()
            
            self.setChart(xValues: self.months, priceChart: self.price, per1chart: self.StandardPer1, per2chart: self.StandardPer2, per3chart: self.StandardPer3, per4chart: self.StandardPer4, per5chart: self.StandardPer5, per6chart: self.StandardPer6)
        }
    }
    
    private func setChart(xValues: [String], priceChart: [Double], per1chart: [Double], per2chart: [Double], per3chart: [Double], per4chart: [Double], per5chart: [Double], per6chart: [Double] ) {
        
        chartView.noDataText = "You need to provide data for the chart."
        
        var priceChartVal : [ChartDataEntry] = []
        var per1ChartVal : [ChartDataEntry] = []
        var per2ChartVal : [ChartDataEntry] = []
        var per3ChartVal : [ChartDataEntry] = []
        var per4ChartVal : [ChartDataEntry] = []
        var per5ChartVal : [ChartDataEntry] = []
        var per6ChartVal : [ChartDataEntry] = []
        
        for i in 0..<xValues.count {
            priceChartVal.append(ChartDataEntry(x: Double(i), y: priceChart[i]))
            per1ChartVal.append(ChartDataEntry(x: Double(i), y: per1chart[i]))
            per2ChartVal.append(ChartDataEntry(x: Double(i), y: per2chart[i]))
            per3ChartVal.append(ChartDataEntry(x: Double(i), y: per3chart[i]))
            per4ChartVal.append(ChartDataEntry(x: Double(i), y: per4chart[i]))
            per5ChartVal.append(ChartDataEntry(x: Double(i), y: per5chart[i]))
            per6ChartVal.append(ChartDataEntry(x: Double(i), y: per6chart[i]))
        }
        
        let per1ChartSet: LineChartDataSet = LineChartDataSet(entries: per1ChartVal, label: "31.83倍\(per1chart[selectedX])")
        per1ChartSet.drawFilledEnabled = true
        per1ChartSet.drawCirclesEnabled = false
        per1ChartSet.colors = [colors[0]]
        per1ChartSet.fillColor = colors[0]
        per1ChartSet.fillAlpha = 1
        per1ChartSet.drawValuesEnabled = false
        
        let per2ChartSet: LineChartDataSet = LineChartDataSet(entries: per2ChartVal, label: "28.53倍\(per2chart[selectedX])")
        per2ChartSet.drawFilledEnabled = true
        per2ChartSet.drawCirclesEnabled = false
        per2ChartSet.colors = [colors[1]]
        per2ChartSet.fillColor = colors[1]
        per2ChartSet.fillAlpha = 1
        per2ChartSet.drawValuesEnabled = false
        
        let per3ChartSet: LineChartDataSet = LineChartDataSet(entries: per3ChartVal, label: "25.23倍\(per3chart[selectedX])")
        per3ChartSet.drawFilledEnabled = true
        per3ChartSet.drawCirclesEnabled = false
        per3ChartSet.colors = [colors[2]]
        per3ChartSet.fillColor = colors[2]
        per3ChartSet.fillAlpha = 1
        per3ChartSet.drawValuesEnabled = false
        
        let per4ChartSet: LineChartDataSet = LineChartDataSet(entries: per4ChartVal, label: "21.94倍\(per4chart[selectedX])")
        per4ChartSet.drawFilledEnabled = true
        per4ChartSet.drawCirclesEnabled = false
        per4ChartSet.colors = [colors[3]]
        per4ChartSet.fillColor = colors[3]
        per4ChartSet.fillAlpha = 1
        per4ChartSet.drawValuesEnabled = false
        
        let per5ChartSet: LineChartDataSet = LineChartDataSet(entries: per5ChartVal, label: "18.64倍\(per5chart[selectedX])")
        per5ChartSet.drawFilledEnabled = true
        per5ChartSet.drawCirclesEnabled = false
        per5ChartSet.colors = [colors[4]]
        per5ChartSet.fillColor = colors[4]
        per5ChartSet.fillAlpha = 1
        per5ChartSet.drawValuesEnabled = false
        
        let per6ChartSet: LineChartDataSet = LineChartDataSet(entries: per6ChartVal, label: "15.34倍\(per6chart[selectedX])")
        per6ChartSet.drawFilledEnabled = true
        per6ChartSet.drawCirclesEnabled = false
        per6ChartSet.colors = [colors[5]]
        per6ChartSet.fillColor = colors[5]
        per6ChartSet.fillAlpha = 1
        per6ChartSet.drawValuesEnabled = false
        
        let priceChartSet = LineChartDataSet(entries: priceChartVal, label: "股價\(priceChart[selectedX])")
        priceChartSet.colors = [colors[6]]
        priceChartSet.drawCirclesEnabled = false
        priceChartSet.drawValuesEnabled = false
        priceChartSet.lineWidth = 2
        
        let data: CombinedChartData = CombinedChartData()
        data.lineData = LineChartData(dataSets: [per1ChartSet, per2ChartSet, per3ChartSet, per4ChartSet, per5ChartSet, per6ChartSet, priceChartSet])
        chartView.data = data
    }
    
}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        selectedX = Int(entry.x)
        self.setChart(xValues: self.months, priceChart: self.price, per1chart: self.StandardPer1, per2chart: self.StandardPer2, per3chart: self.StandardPer3, per4chart: self.StandardPer4, per5chart: self.StandardPer5, per6chart: self.StandardPer6)
    }
}

extension ViewController: AxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return months[Int(value)]
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

