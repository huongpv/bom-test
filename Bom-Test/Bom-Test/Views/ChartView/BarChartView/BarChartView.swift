//
//  BarChartView.swift
//  GiamDoc
//
//  Created by huongpv on 5/24/19.
//  Copyright © 2019 vinhdd. All rights reserved.
//

import UIKit
import Highcharts

class BarChartView: UIView {
    @IBOutlet var contentView: UIView!
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
        Bundle.main.loadNibNamed("BarChartView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let item1 = BarChartModel(name: "Jane", data: [3, 2, 1])
        updatePieChartView(items: [item1], xaxisCategories: ["T2", "T3", "T4"])
    }

    func updatePieChartView(items: [BarChartModel], xaxisCategories: [String]) {
        let options = HIOptions()
        
        let chart = HIChart()
        chart.type = "column"
        
        let title = HITitle()
        title.text = ""
        
        let xaxis = HIXAxis()
        xaxis.categories = xaxisCategories
        xaxis.crosshair = HICrosshair()
        let xLabels = HILabels()
        xLabels.enabled = false
        xaxis.labels = xLabels
        
        let yaxis = HIYAxis()
        yaxis.min = 0
        yaxis.title = HITitle()
        yaxis.title.text = ""
        let yLabels = HILabels()
        yLabels.enabled = false
        yaxis.labels = yLabels
        
        let tooltip = HITooltip()
        tooltip.formatter = HIFunction(jsFunction: "function () { return '<b>' + this.series.name + '</b><br/>' + this.point.y + ' ' + this.point.name.toLowerCase(); }")
        
        let plotOptions = HIPlotOptions()
        plotOptions.column = HIColumn()
        plotOptions.column.pointPadding = 0.2
        plotOptions.column.borderWidth = 0
        plotOptions.column.showInLegend = NSNumber(value: false)
    
        var bars = [HIColumn]()
        items.forEach { (item) in
            let bar = HIColumn()
            bar.name = ""
            bar.data = item.data
            
            bars.append(bar)
        }
        
        let colors = ["#34AA44", "#34AA44", "#34AA44", "#34AA44", "#F7B500", "#F7B500", "#F7B500"]
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        
        options.exporting = exporting
        options.credits = credits
        options.colors = colors
        options.chart = chart
        options.title = title
        options.xAxis = [xaxis]
        options.yAxis = [yaxis]
        options.tooltip = tooltip
        options.plotOptions = plotOptions
        options.series = bars
        
        chartView.options = options
    }
}
