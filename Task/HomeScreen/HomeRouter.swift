//
//  HomeRouter.swift
//  Task
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//


import UIKit

@objc protocol HomeRoutingLogic
{
  func routedetailsVedioVC()
}

protocol HomeDataPassing
{
  var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing
{
  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?
  
  // MARK: Routing
  
  func routedetailsVedioVC()
  {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailsVedioViewController") as! DetailsVedioViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    
  }

  // MARK: Navigation
  
  func navigateToSomewhere(source: HomeViewController, destination: DetailsVedioViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToSomewhere(source: HomeDataStore, destination: inout DetailsVedioDataStore)
  {
    let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
    destination.video = source.vedios?[selectedRow!]
     }
}
