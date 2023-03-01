//
//  Student.swift
//  02_01_2023_SQLiteDemoVersion2
//
//  Created by Vishal Jagtap on 28/02/23.
//

import Foundation
class Student{
    var rollNumber : Int
    var studentName : String
    var fees : Double
    init(rollNumber: Int, studentName: String, fees : Double) {
        self.rollNumber = rollNumber
        self.studentName = studentName
        self.fees = fees
    }
}
