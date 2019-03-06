//
//  euler022.swift
//  projectEuler
//
//  Created by Radic on 06/03/2019.
//  Copyright © 2019 Radic. All rights reserved.
//

import Foundation

func loadStringFrom(fileName: String) -> String? { // Assuming that file is in home directory
    let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
    var readString = ""
    
    if !FileManager.default.fileExists(atPath: fileURL.path) {
        return nil
    }
    
    do {
        readString = try String(contentsOf: fileURL)
    } catch let error as NSError {
        print("Failed to read from file \(fileURL) with error \(error)!")
        return nil
    }
    
    return readString
}

func convertToSortedArray(str: String) -> [String] {
    let separated = str.split(separator: ",")
    var result = [String]()
    
    for element in separated { // Filter " symbols
        result.append(element.filter{ $0 != "\"" })
    }
    
    return result.sorted(by: <)
}

func calcAlphabetValue(str: String) -> Int {
    let abc = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
               "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var alphabetValue = 0
    
    for char in str {
        alphabetValue += abc.firstIndex(of: String(char).uppercased()) ?? 0
    }
    
    return alphabetValue + str.count
}

func euler022(fileName: String) -> Int? {
    
    var nameScores = 0
    var counter = 1
    
    if let str = loadStringFrom(fileName: fileName) {
        let strArr = convertToSortedArray(str: str)
        
        for element in strArr {
            nameScores += calcAlphabetValue(str: element) * counter
            counter += 1
        }
    } else { return nil }
    
    return nameScores
}
