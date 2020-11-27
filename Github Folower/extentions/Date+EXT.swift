//
//  Date+EXT.swift
//  Github Folower
//
//  Created by MAC on 27/11/2020.
//

import UIKit

extension Date{
    func dateStringWithFormat(format:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
