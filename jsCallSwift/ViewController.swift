//
//  ViewController.swift
//  jsCallSwift
//
//  Created by bmbhh on 9/15/15.
//  Copyright (c) 2015 bmbhh. All rights reserved.
//

import Cocoa
import WebKit
class ViewController: NSViewController {
    var webView:WebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView = WebView(frame: self.view.frame)
        webView.frameLoadDelegate = self
        var url = NSURL(string: NSBundle.mainBundle().pathForResource("index", ofType: "html")!)
        var request = NSURLRequest(URL: url!)
        webView.mainFrame.loadRequest(request)
        self.view.addSubview(webView)
    }
    override func webView(webView: WebView!, didClearWindowObject windowObject: WebScriptObject!, forFrame frame: WebFrame!) {
        windowObject.setValue(self, forKey: "interOp")
    }
    override class func webScriptNameForSelector(aSelector:Selector) -> String
    {
        if aSelector == "callSwift:"
        {
            return "callSwift"
        }
        else
        {
            return ""
        }
    }
    override class func isSelectorExcludedFromWebScript(aSelector: Selector) -> Bool
    {
        return false
    }
    func callSwift(message:String)
    {
        var alert = NSAlert()
        alert.messageText = message
        alert.beginSheetModalForWindow(self.view.window!, completionHandler: nil)
    }
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

