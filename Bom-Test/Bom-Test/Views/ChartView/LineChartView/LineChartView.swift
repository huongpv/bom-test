//
//  LineChart.swift
//  GiamDoc
//
//  Created by huongpv on 5/23/19.
//  Copyright © 2019 vinhdd. All rights reserved.
//

import UIKit
import Highcharts

class LineChartView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var chartView: HIChartView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LineChartView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        let item1 = LineChartModel(name: "", data: [7, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2], color: .red)
        let item2 = LineChartModel(name: "", data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17], color: .green)
        let xaxisCategories = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        
        updateLineChartView(items: [item1, item2], xaxisCategories: xaxisCategories)
    }
    
    func updateLineChartView(items: [LineChartModel], xaxisCategories: [String]) {
        let options = HIOptions()
        
        let chart = HIChart()
        chart.type = "line"
        
        let title = HITitle()
        title.text = ""
        
        let xaxis = HIXAxis()
        xaxis.categories = xaxisCategories
        
        let yaxis = HIYAxis()
        yaxis.title = HITitle()
        yaxis.title.text = ""
        
        let plotoptions = HIPlotOptions()
        plotoptions.line = HILine()
        plotoptions.line.dataLabels = HIDataLabelsOptionsObject()
        plotoptions.line.dataLabels.enabled = NSNumber(value: false)
        plotoptions.line.enableMouseTracking = NSNumber(value: false)
        
        var lines = [HILine]()
        items.forEach { (item) in
            let line = HILine()
            line.name = ""
            line.data = item.data
            
            lines.append(line)
        }
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        
        let colors = ["#0091FF", "#44D7B6", "#F7B500", "#0091FF"]
        
        let legend = HILegend()
        legend.layout = "vertical"
        legend.align = "right"
        legend.verticalAlign = "middle"
        
        options.legend = legend
        options.exporting = exporting
        options.credits = credits
        options.chart = chart
        options.colors = colors
        options.title = title
        options.xAxis = [xaxis]
        options.yAxis = [yaxis]
        options.plotOptions = plotoptions
        options.series = lines
        
        chartView.options = options
    }

}
