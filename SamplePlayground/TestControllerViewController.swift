//
//  TestControllerViewController.swift
//  SamplePlayground
//
//  Created by Sagar Mane on 28/02/17.
//  Copyright © 2017 MangoApps. All rights reserved.
//

import UIKit

class InnerTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        return self.contentSize
    }
}

class QuizCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet
    var labelView: UILabel?
    
    @IBOutlet
    var tableView: UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //self.tableView?.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.estimatedRowHeight = 40
        
        self.tableView?.register(UINib(nibName: "QuizResultAnswerCell", bundle: nil), forCellReuseIdentifier: "QuizResultAnswerCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        labelView?.text = "Walmart is today rolling out an updated app that will allow those visiting the store’s Pharmacy or Money Services desk to skip having to wait in line, the company says. After entering their personal information in the app, customers can order prescription refills or fill out other necessary paperwork from their phone. When they arrive at the store, they will then get in a new “Express Lane,” which lets them move to the front of the line, ahead of those already waiting. \(indexPath.row)"
        
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "QuizResultAnswerCell", for: indexPath) as! QuizResultAnswerCell
        resultCell.label?.text = "Walmart is today rolling out an updated app that will allow those visiting the store’s Pharmacy or Money Services desk to skip having to wait in line, the company says. After entering their personal information in the app, customers can order prescription refills or fill out other necessary paperwork from their phone. When they arrive at the store, they will then get in a new “Express Lane,” which lets them move to the front of the line, ahead of those already waiting. \(indexPath.row)"
        return resultCell
    }
    
    @objc(tableView:willDisplayCell:forRowAtIndexPath:) func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        self.setNeedsLayout()
    }
}

class TestControllerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView?.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0)
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.estimatedRowHeight = 40
        
        self.tableView?.register(UINib(nibName: "QuizCell", bundle: nil), forCellReuseIdentifier: "QuizCell")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath) as! QuizCell
        //resultCell.tableView?.sizeToFit()
        //resultCell.tableHolderHeight?.constant = 400;
        return resultCell
    }

}
