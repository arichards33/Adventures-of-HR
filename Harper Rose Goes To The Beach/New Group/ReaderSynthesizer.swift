//
//  readerSynthesizer.swift
//  Harper Rose Goes To The Beach
//
//  Created by Alex Richards on 4/14/18.
//  Copyright © 2018 Alex Richards. All rights reserved.
//

import Foundation
import AVFoundation

class ReaderSynthesizer: NSObject, AVSpeechSynthesizerDelegate {

    static let sharedSynthesizer = ReaderSynthesizer()
    
    let synthesizer = AVSpeechSynthesizer()
    var textIn: UILabel!
    
    //MARK: - Read Out Loud
    func readToMe(text: UILabel){
        synthesizer.delegate = self
        textIn = text
        synthesizer.stopSpeaking(at: .word)
        let voice = AVSpeechSynthesisVoice(language: "en_US")
        let utterance = AVSpeechUtterance(string: text.text!)
        utterance.voice = voice
        utterance.pitchMultiplier = 1.0
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
    
    //MARK: - Highlight Words
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let attributes = [NSAttributedStringKey.backgroundColor: UIColor.darkGray,
                          NSAttributedStringKey.foregroundColor: UIColor.white]
    
        let highlightedWord = NSMutableAttributedString(string: utterance.speechString)
        
    
        highlightedWord.setAttributes(attributes, range: characterRange)
        
        textIn.attributedText = highlightedWord
    }
    
    func stopSpeaking(){
        synthesizer.stopSpeaking(at: .immediate)
    }
}
