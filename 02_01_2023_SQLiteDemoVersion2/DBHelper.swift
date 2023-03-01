//
//  DBHelper.swift
//  02_01_2023_SQLiteDemoVersion2
//
//  Created by Vishal Jagtap on 28/02/23.
//

import Foundation
import SQLite3

class DBHelper{
    var students : [Student] = []
    var dbPath = "mydb.sqlite"
    var db : OpaquePointer?
    init(){
        self.db = openDatabase()
        self.createDatabase()
    }
    
    func openDatabase()->OpaquePointer?{
        var db : OpaquePointer? = nil
        let fileUrl = try! FileManager.default.url(for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false).appendingPathExtension(dbPath)
        
        if(sqlite3_open(fileUrl.path, &db)) != SQLITE_OK{
            print("The Database not opened succesfully")
            return nil
        }else{
            print("The Database created successfully")
            print("db --\(db) -- db Path -- \(dbPath)")
            print(fileUrl.path)
            return db
        }
    }
    
    func createDatabase(){
        let createStudentTableQueryString = "CREATE TABLE IF NOT EXISTS student(RollNumber INTEGER,StudentName TEXT, Fees DOUBLE);"
        var createStatement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db,
                              createStudentTableQueryString,
                              -1,
                              &createStatement,
                              nil) == SQLITE_OK{
            print("Created Statement Successful")
            if sqlite3_step(createStatement) == SQLITE_DONE{
                print("Table Created")
            } else {
                print("Table not Created")
            }
            
        } else {
            print("Not Created Statement")
        }
    }
}
