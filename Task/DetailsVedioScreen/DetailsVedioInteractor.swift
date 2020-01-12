//
//  DetailsVedioInteractor.swift
//  Task
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//


import UIKit

protocol DetailsVedioBusinessLogic
{
 func setValues()
}

protocol DetailsVedioDataStore
{
  var video: Video? { get set }
}

class DetailsVedioInteractor: DetailsVedioBusinessLogic, DetailsVedioDataStore
{
    
    var video: Video?
    
  var presenter: DetailsVedioPresentationLogic?
  var worker: DetailsVedioWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func setValues()
  {
    presenter?.presentVideoInfo(response: video!)
  }
}
