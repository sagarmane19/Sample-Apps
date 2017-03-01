//
//  ViewController.swift
//  SamplePlayground
//
//  Created by Sagar Mane on 28/02/17.
//  Copyright © 2017 MangoApps. All rights reserved.
//

import UIKit

class QuizResultAnswerCell: UITableViewCell {
    
    @IBOutlet
    var label: UILabel?
    
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet
    var tableView: UITableView?
    
    @IBOutlet
    var tableHeight: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView?.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0)
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.estimatedRowHeight = 40
        
        self.tableView?.register(UINib(nibName: "QuizResultAnswerCell", bundle: nil), forCellReuseIdentifier: "QuizResultAnswerCell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "QuizResultAnswerCell", for: indexPath) as! QuizResultAnswerCell
        resultCell.label?.text = "Walmart is today rolling out an updated app that will allow those visiting the store’s Pharmacy or Money Services desk to skip having to wait in line, the company says. After entering their personal information in the app, customers can order prescription refills or fill out other necessary paperwork from their phone. When they arrive at the store, they will then get in a new “Express Lane,” which lets them move to the front of the line, ahead of those already waiting. \(indexPath.row)"
        return resultCell
    }
    
    @objc(tableView:willDisplayCell:forRowAtIndexPath:) func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tableView.indexPathsForVisibleRows?.last?.row {
            print("\(tableView.contentSize.height)")
            
            //self.tableHeight?.constant = (self.tableView?.contentSize.height)! - 60
        }
    }
}

