//
//  ViewController.swift
//  OftenWorld
//  Test GitHub
//  Created by Nazar on 11.02.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet weak var enterText: UITextView!
    @IBOutlet weak var labelText: UILabel!
    
    private var oftenDictionary: [String: Int] = [:]
    
    private let testText = "Tom felt he could not learn and his mother could not get a job as she was so worried about what would happen if he ran home from school and found her gone"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterText.text = testText
        labelText.text = "How often used words in text?"
    }
    
    @IBAction func PRESS(_ sender: UIButton) {
        oftenDictionary.removeAll()
        let inputText = (enterText.text ?? testText) + "."
        replaceSymbol(text: inputText)
        //        print(oftenDictionary.flatMap({$0}).sorted { $0.0.1 > $0.1.1 })
        //        print(oftenDictionary.sorted(by: { (a, b) in (a.value ) > (b.value ) }))
        print(oftenDictionary.sorted(by: { $0.0.value > $0.1.value}))
        let m = sortByOften(dict: oftenDictionary)
        labelText.text = String(m.count) + "\n" + String(describing: m)
    }
    
    private func sortByOften(dict: [String: Int]) -> [(String, Int)]{
        return dict.sorted(by: { $0.0.value > $0.1.value})
    }
    
    private func putWorldInDictionary(word: String) -> Void {
        if let temp = self.oftenDictionary[word] {
            self.oftenDictionary[word] = temp + 1
        } else {
            oftenDictionary[word] = 1
        }
    }
    
    private func replaceSymbol(text: String) -> Void {
        var word: String = ""
        for i in text.lowercased().characters
        {
            switch i {
            case " ",".",",","?","!","/","\"","\n","%","[","]","{","}","(",")","\\","'":
                if word != "" {
                    putWorldInDictionary(word: word)
                    word = ""
                }
            default: word += String(i)
            }
        }
    }
}

