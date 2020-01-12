//
//  DetailsVedioRouter.swift
//  Task
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//

import UIKit

@objc protocol DetailsVedioRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DetailsVedioDataPassing
{
  var dataStore: DetailsVedioDataStore? { get }
}

class DetailsVedioRouter: NSObject, DetailsVedioRoutingLogic, DetailsVedioDataPassing
{
  weak var viewController: DetailsVedioViewController?
  var dataStore: DetailsVedioDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: DetailsVedioViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: DetailsVedioDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
