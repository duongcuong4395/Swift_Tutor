//
//  StringExtension.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/13/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

extension String {

     func verifyUrl () -> Bool {
        if let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    /// Counting words in a string
    /// Example:
    /// let phrase = "The rain in Spain"
    /// print(phrase.wordCount)
    var wordCount: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
    
    /// Replacing a fix number of substrings
    /// Example:
    /// let phrase = "How much wood would a woodchuck chuck if a woodchuck would chuck wood?"
    /// print(phrase.replacingOccurrences(of: "would", with: "should", count: 1))
    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
        var count = 0
        var returnValue = self

        while let range = returnValue.range(of: search) {
            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
            count += 1

            // exit as soon as we've made all replacements
            if count == maxReplacements {
                return returnValue
            }
        }

        return returnValue
    }
    
    /// Truncating with ellipsis
    /// Example:
    /// let testString = "He thrusts his fists against the posts and still insists he sees the ghosts."
    /// print(testString.truncate(to: 20, addEllipsis: true))
    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }

        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]

        if addEllipsis {
            return "\(trimmed)..."
        } else {
            return String(trimmed)
        }
    }
    
    /// Adding a prefix to a string
    /// If you have a collection of URLs like “www.hackingwithswift.com” and you want to make sure they all start with “https://“
    /// But what if some have the “https://“ prefix already? In that case you’ll end up with some that are correct, and others that are “https://https://www.apple.com”. Awkward!
    /// Here’s a small extension to avoid that problem entirely, because it checks whether the prefix exists before adding it:
    /// Example:
    /// let url = "www.hackingwithswift.com"
    /// let fullURL = url.withPrefix("https://")
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    
    /*
     import <CommonCrypto/CommonCrypto.h>
    var md5: String? {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        
        guard let data = self.data(using: String.Encoding.utf8) else { return nil }
        
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash: [UInt8] = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        
        return (0..<length).map { String(format: "%02x", hash[$0]) }.joined()
    }
 
     
     */
}

// Parsing JSON From a String
extension Data {
    init?(json: Any) {
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed) else { return nil }
        self.init(data)
    }
    
    func jsonToDictionary() -> [String: Any]? {
        (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) as? [String: Any]
    }
    
    func jsonToArray() -> [Any]? {
        (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) as? [Any]
    }
}


extension String {
    init?(json: Any) {
        guard let data = Data(json: json) else { return nil }
        self.init(decoding: data, as: UTF8.self)
    }
    
    func jsonToDictionary() -> [String: Any]? {
        self.data(using: .utf8)?.jsonToDictionary()
    }
    
    func jsonToArray() -> [Any]? {
        self.data(using: .utf8)?.jsonToArray()
    }
}


extension Bundle {
    
    /// Decoding JSON from your bundle
    /// 1. Find the URL for the JSON file in your bundle. If that fails, throw an error.
    /// 2. Try to load the URL into a Data instance. If that fails, throw an error.
    /// 3. Attempt to decode that data into instances of your object. If that fails, throw an error.
    /// 4. Finally, you have your data.
    /// Example:
    /// let items = Bundle.main.decode([TourItem].self, from: "Tour.json")
    func decode<T: Decodable>(_ type: T.Type, from filename: String) -> T {
        guard let json = url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate \(filename) in app bundle.")
        }

        guard let jsonData = try? Data(contentsOf: json) else {
            fatalError("Failed to load \(filename) from app bundle.")
        }

        let decoder = JSONDecoder()

        guard let result = try? decoder.decode(T.self, from: jsonData) else {
            fatalError("Failed to decode \(filename) from app bundle.")
        }

        return result
    }
}

extension Comparable {
    
    /// Clamping a number
    /// Clamping is the practice of forcing a value to fall within a specific range. For example, if I say “pick a number between 10 and 20”…
    /// If you pick 15 then your number is 15.
    /// If you pick 5, below the bottom of our range, then your number is clamped to 10.
    /// If you pick 50, above the top of our range, then your number is clamped to 20.
    /// Example:
    /// let number2 = 5.0
    /// print(number2.clamp(low: 0, high: 10))
    /// let letter1 = "r"
    /// print(letter1.clamp(low: "a", high: "f"))
    func clamp(low: Self, high: Self) -> Self {
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }

        return self
    }
}



extension Date {
    
    /// Counting elapsed days
    /// Example:
    func days(between otherDate: Date) -> Int {
        let calendar = Calendar.current

        let startOfSelf = calendar.startOfDay(for: self)
        let startOfOther = calendar.startOfDay(for: otherDate)
        let components = calendar.dateComponents([.day], from: startOfSelf, to: startOfOther)

        return abs(components.day ?? 0)
    }
}
