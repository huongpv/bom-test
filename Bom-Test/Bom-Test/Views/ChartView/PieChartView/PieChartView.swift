//
//  PieChartView.swift
//  HighChart-Swift
//
//  Created by huongpv on 5/22/19.
//  Copyright © 2019 huongpv. All rights reserved.
//

import UIKit
import Highcharts

class PieChartView: UIView {

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
        Bundle.main.loadNibNamed("PieChartView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func updatePieChartView(data: [PieChartModel]) {
        let options = HIOptions()
        
        let chart = HIChart()
        chart.plotBackgroundColor = HIColor()
        chart.plotBorderWidth = NSNumber()
        chart.plotShadow = NSNumber(value: false)
        chart.type = "pie"
        
        let title = HITitle()
        title.text = ""
        
        let tooltip = HITooltip()
        tooltip.pointFormat = "{series.name}: <b>{point.percentage:.1f}%</b>"
        
        let plotoptions = HIPlotOptions()
        plotoptions.pie = HIPie()
        plotoptions.pie.allowPointSelect = NSNumber(value: false)
        plotoptions.pie.cursor = "pointer"
        plotoptions.pie.innerSize = "55%"
        plotoptions.pie.dataLabels = HIDataLabelsOptionsObject()
        plotoptions.pie.dataLabels.enabled = NSNumber(value: true)
        plotoptions.pie.dataLabels.format = "{point.percentage:.1f} %"
        plotoptions.pie.showInLegend = NSNumber(value: true)
        
        let pie = HIPie()
        pie.name = "Brands"
        
        pie.data = [];
        data.forEach { (item) in
            let dict: [String : Any] = [
                "name": item.name,
                "y": NSNumber(value: item.value)
            ]
            pie.data.append(dict)
        }
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let credits = HICredits()
        credits.enabled = false
        
        let colors = ["#44D7B6", "#FE4D62", "#F7B500", "#0091FF", "#B620E0", "#6DD400"]
        
        let legend = HILegend()
        legend.layout = "vertical"
        legend.align = "right"
        legend.verticalAlign = "middle"
        legend.itemMarginBottom = 8
        legend.symbolRadius = 2
        
        options.legend = legend
        options.exporting = exporting
        options.chart = chart
        options.colors = colors
        options.title = title
        options.tooltip = tooltip
        options.plotOptions = plotoptions
        options.series = [pie]
        options.credits = credits
        chartView.options = options
    }

}
