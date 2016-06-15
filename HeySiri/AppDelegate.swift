//
//  AppDelegate.swift
//  HeySiri
//
//  Created by Daniel Li on 6/14/16.
//  Copyright © 2016 Daniel Li. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSSpeechRecognizerDelegate {

    @IBOutlet weak var window: NSWindow!

    var recognizer: NSSpeechRecognizer?
    var statusItem: NSStatusItem?
    var darkModeOn: Bool = false

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let synthesizer = NSSpeechSynthesizer(voice: "com.apple.speech.synthesis.voice.Alex")
        print(NSSpeechSynthesizer.availableVoices())
        synthesizer?.startSpeaking("Welcome to Hey Siri")
        if let recognizer = NSSpeechRecognizer() {
            recognizer.delegate = self
            recognizer.commands = ["hey siri"]
            recognizer.listensInForegroundOnly = false
            recognizer.startListening()
        }
        
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func speechRecognizer(_ sender: NSSpeechRecognizer, didRecognizeCommand command: String) {
        print(command)
        if command == "hey siri" {
            NSWorkspace.shared().openFile("", withApplication: "Siri")
        }
    }

}

