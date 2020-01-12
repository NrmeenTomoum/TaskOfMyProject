//
//  DetailsVedioPresenter.swift
//  Task
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//


import UIKit

protocol DetailsVedioPresentationLogic
{
    func presentVideoInfo(response: Video)
}

class DetailsVedioPresenter: DetailsVedioPresentationLogic
{
  weak var viewController: DetailsVedioDisplayLogic?
  
//  // MARK: Do something
//
 func presentVideoInfo(response: Video)
  {
    viewController?.displayVideoInfo(response: response)
  }
}
