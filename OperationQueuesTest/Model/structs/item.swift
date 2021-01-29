//
//  item.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

struct Item: Codable{
    
    var date: Int? = nil
    var state: String? = nil
    var positive: Int? = nil
    var totalTestResultsSource: String? = nil
    var totalTestResults: Int? = nil
    var hospitalizedCurrently: Int? = nil
    var hospitalizedCumulative: Int? = nil
    var onVentilatorCurrently: Int? = nil
    var onVentilatorCumulative: Int? = nil
    var recovered: Int? = nil
    var dataQualityGrade: String? = nil
    var lastUpdateEt: String? = nil
    var dateModified: String? = nil
    var checkTimeEt: String? = nil
    var death: Int? = nil
    var hospitalized: Int? = nil
    var dateChecked: String? = nil
    var totalTestsViral: Int? = nil
    var positiveTestsViral: Int? = nil
    var negativeTestsViral: Int? = nil
    
    private struct APIItemName{
        static let date = "date"
        static let state = "state"
        static let positive = "positive"
        static let totalTestResultsSource = "totalTestResultsSource"
        static let totalTestResults = "totalTestResults"
        static let hospitalizedCurrently = "hospitalizedCurrently"
        static let hospitalizedCumulative = "hospitalizedCumulative"
        static let onVentilatorCurrently = "onVentilatorCurrently"
        static let onVentilatorCumulative = "onVentilatorCumulative"
        static let recovered = "recovered"
        static let dataQualityGrade = "dataQualityGrade"
        static let lastUpdateEt = "lastUpdateEt"
        static let dateModified = "dateModified"
        static let checkTimeEt = "checkTimeEt"
        static let death = "death"
        static let hospitalized = "hospitalized"
        static let dateChecked = "dateChecked"
        static let totalTestsViral = "totalTestsViral"
        static let positiveTestsViral = "positiveTestsViral"
        static let negativeTestsViral = "negativeTestsViral"
    }
    init?(dictionary: [String: Any]) {
        date = dictionary[APIItemName.date] as? Int
        state = dictionary[APIItemName.state] as? String
        positive = dictionary[APIItemName.positive] as? Int
        totalTestResultsSource = dictionary[APIItemName.totalTestResultsSource] as? String
        totalTestResults = dictionary[APIItemName.totalTestResults] as? Int
        hospitalizedCurrently = dictionary[APIItemName.hospitalizedCurrently] as? Int
        hospitalizedCumulative = dictionary[APIItemName.hospitalizedCumulative] as? Int
        onVentilatorCurrently = dictionary[APIItemName.onVentilatorCurrently] as? Int
        onVentilatorCumulative = dictionary[APIItemName.onVentilatorCumulative] as? Int
        recovered = dictionary[APIItemName.recovered] as? Int
        dataQualityGrade = dictionary[APIItemName.dataQualityGrade] as? String
        lastUpdateEt = dictionary[APIItemName.lastUpdateEt] as? String
        dateModified = dictionary[APIItemName.dateModified] as? String
        checkTimeEt = dictionary[APIItemName.checkTimeEt] as? String
        death = dictionary[APIItemName.death] as? Int
        hospitalized = dictionary[APIItemName.hospitalized] as? Int
        dateChecked = dictionary[APIItemName.dateChecked] as? String
        totalTestsViral = dictionary[APIItemName.totalTestsViral] as? Int
        positiveTestsViral = dictionary[APIItemName.positiveTestsViral] as? Int
        negativeTestsViral = dictionary[APIItemName.negativeTestsViral] as? Int
    }
    
}

