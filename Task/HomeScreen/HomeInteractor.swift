//
//  HomeInteractor.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic
{
func setVedios()
}

protocol HomeDataStore
{
  var vedios: [Video]? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
  var vedios: [Video]?
  var presenter: HomePresentationLogic?
  var worker: HomeWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func setVedios()
  {
  vedios = Video.allVideos()
  }
}
