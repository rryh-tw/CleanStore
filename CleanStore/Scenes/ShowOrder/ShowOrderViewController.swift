//
//  ShowOrderViewController.swift
//  CleanStore
//
//  Created by Raymond Law on 2/17/16.
//  Copyright (c) 2016 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ShowOrderViewControllerInput
{
  func displayOrder(viewModel: ShowOrder.GetOrder.ViewModel)
}

protocol ShowOrderViewControllerOutput
{
  func getOrder(request: ShowOrder.GetOrder.Request)
  var order: Order! { get set }
}

class ShowOrderViewController: UIViewController, ShowOrderViewControllerInput
{
  var output: ShowOrderViewControllerOutput!
  var router: ShowOrderRouter!
  
  @IBOutlet weak var orderIDLabel: UILabel!
  @IBOutlet weak var orderDateLabel: UILabel!
  @IBOutlet weak var orderEmailLabel: UILabel!
  @IBOutlet weak var orderNameLabel: UILabel!
  @IBOutlet weak var orderTotalLabel: UILabel!
  
  // MARK: - Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    ShowOrderConfigurator.sharedInstance.configure(self)
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    getOrderOnLoad()
  }
  
  // MARK: - Event handling
  
  func getOrderOnLoad()
  {
    let request = ShowOrder.GetOrder.Request()
    output.getOrder(request)
  }
  
  // MARK: - Display logic
  
  func displayOrder(viewModel: ShowOrder.GetOrder.ViewModel)
  {
    let displayedOrder = viewModel.displayedOrder
    orderIDLabel.text = displayedOrder.id
    orderDateLabel.text = displayedOrder.date
    orderEmailLabel.text = displayedOrder.email
    orderNameLabel.text = displayedOrder.name
    orderTotalLabel.text = displayedOrder.total
  }
}