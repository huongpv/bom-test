//
//  BarChartTwoColView.swift
//  SmartMedical
//
//  Created by huongpv on 3/29/19.
//  Copyright © 2019 RikkeiSoft. All rights reserved.
//

import UIKit
import Charts

class BarChartTwoColView: UIView {
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
    let notgood = [10.0, 14.0, 60.0, 13.0, 2.0, 10.0, 15.0, 18.0, 25.0, 05.0, 10.0, 19.0]
    
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
        Bundle.main.loadNibNamed("BarChartTwoColView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
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
        var dataEntries1: [BarChartDataEntry] = []
        
        for i in 0..<self.axisData.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i) , y: Double(self.good[i]))
            dataEntries.append(dataEntry)
            
            let dataEntry1 = BarChartDataEntry(x: Double(i) , y: Double(self.notgood[i]))
            dataEntries1.append(dataEntry1)
            
        }
        
        let set1 = BarChartDataSet(values: dataEntries, label: "Tiêu cực")
        set1.setColor(UIColor(red: 234/255, green: 236/255, blue: 238/255, alpha: 1))
        
        let set2 = BarChartDataSet(values: dataEntries1, label: "Tích cực")
        set2.setColor(UIColor(red: 22/255, green: 101/255, blue: 216/255, alpha: 1))
        
        let chartData = BarChartData(dataSets: [set1, set2])
        chartData.setValueFont(.systemFont(ofSize: 10, weight: .light))
        
        let groupSpace = 0.08
        let barSpace = 0.03
        let barWidth = 0.2
        
        chartData.barWidth = barWidth
        
        
        chartView.xAxis.axisMinimum = 0.0
        chartView.xAxis.axisMaximum = 0.0 + chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(self.axisData.count)
        
        chartData.groupBars(fromX: 0.0, groupSpace: groupSpace, barSpace: barSpace)
        
        chartView.xAxis.granularity = chartView.xAxis.axisMaximum / Double(self.axisData.count)
        chartView.xAxis.setLabelCount(axisData.count, force: false)
        chartView.xAxis.labelWidth = CGFloat(chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace))
        chartView.data = chartData
        
        chartView.notifyDataSetChanged()
        chartView.animate(yAxisDuration: 1.0, easingOption: .linear)
        chartData.setDrawValues(false)
    }
    
}

extension BarChartTwoColView: IAxisValueFormatter {

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


