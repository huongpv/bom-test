//
//  BarChartOneColView.swift
//  Bom-Test
//
//  Created by Macbook on 4/7/19.
//  Copyright © 2019 huongpv. All rights reserved.
//

import UIKit
import Charts

class BarChartOneColView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var chartView: BarChartView!
    
    // MARK: - Constants
    fileprivate let axisWeek = [
        "T2",
        "T3",
        "T4",
        "T5",
        "T6",
        "T7",
        "CN"
    ]
    
    fileprivate let axisMonth = [
        "T1",
        "T2",
        "T3",
        "T4",
        "T5",
        "T6",
        "T7",
        "T8",
        "T9",
        "T10",
        "T11",
        "T12"
    ]
    
    fileprivate let axisYears = [
        "2017",
        "2018",
        "2019"
    ]
    
    let good = [20.0, 4.0, 6.0, 3.0, 12.0, 50.0, 25.0, 57.0, 60.0, 28.0, 17.0, 47.0]
    
    var axisData: [String]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BarChartOneColView", owner: self, options: nil)
        contentView.fixInView(self)
        
        axisData = axisWeek
        setupView()
    }
    
    func setAxisData(type: Calendar.Component) {
        switch type {
        case .weekday:
            axisData = axisWeek
        case .month:
            axisData = axisMonth
        case .year:
            axisData = axisYears
        default:
            axisData = axisWeek
        }
        setupView()
        
    }
    
    func setupView() {
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        chartView.pinchZoomEnabled = false
        //legend
        let legend = chartView.legend
        legend.enabled = true
        legend.horizontalAlignment = .left
        legend.verticalAlignment = .top
        legend.orientation = .horizontal
        legend.drawInside = true
        legend.yOffset = 10.0;
        legend.xOffset = 10.0;
        legend.yEntrySpace = 0.0;
        legend.textColor = UIColor.black
        
        // Y - Axis Setup
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        
        // X - Axis Setup
        let xaxis = chartView.xAxis
        let formatter = self
        xaxis.valueFormatter = formatter
        
        xaxis.drawGridLinesEnabled = false
        xaxis.labelPosition = .bottom
        xaxis.labelTextColor = UIColor.black
        xaxis.centerAxisLabelsEnabled = true
        xaxis.axisLineColor = UIColor.clear
        xaxis.granularityEnabled = true
        xaxis.enabled = true
        
        chartView.noDataText = "You need to provide data for the chart."
        chartView.noDataTextColor = UIColor.black
        chartView.chartDescription?.textColor = UIColor.clear
        
        setChart()
    }
    
    func setChart() {
        chartView.noDataText = "Loading...!!"
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<self.axisData.count {
            let dataEntry = BarChartDataEntry(x: Double(i) , y: Double(self.good[i]))
            dataEntries.append(dataEntry)
        }
        
        let set1 = BarChartDataSet(values: dataEntries, label: "Tích cực")
        set1.setColor(UIColor(red: 234/255, green: 236/255, blue: 238/255, alpha: 1))
        
        let chartData = BarChartData(dataSet: set1)
        chartData.setValueFont(.systemFont(ofSize: 10, weight: .light))
        
        let barWidth = 0.4
        
        chartData.barWidth = barWidth
        
        chartView.xAxis.setLabelCount(axisData.count, force: false)
        chartView.data = chartData
        
        chartView.notifyDataSetChanged()
        chartView.animate(yAxisDuration: 1.0, easingOption: .linear)
        chartData.setDrawValues(false)
    }
    
}

extension BarChartOneColView: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        let count = self.axisData.count
        
        guard let axis = axis, count > 0 else {
            
            return ""
        }
        
        let factor = axis.axisMaximum / Double(count)
        
        let index = Int((value / factor).rounded())
        
        if index >= 0 && index < count {
            
            return self.axisData[index]
        }
        
        return ""
    }
}
