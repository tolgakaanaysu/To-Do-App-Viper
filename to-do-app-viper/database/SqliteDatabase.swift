//
//  SqliteDatabase.swift
//  to-do-app-viper
//
//  Created by Tolga Kağan Aysu on 31.08.2022.
//

import Foundation

class SqliteDatabase {
    static var share = SqliteDatabase()
    var database: FMDatabase?
    private init(){}
    func setupDatabase(){
        let bundlePath = Bundle.main.path(forResource: "Todo-App", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyLocation = URL(fileURLWithPath: targetPath).appendingPathComponent("Todo-App.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: copyLocation.path) {
            print("Veritabanı zaten var")
        }
        else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: copyLocation.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        database = FMDatabase(path: copyLocation.path)
    }
}
