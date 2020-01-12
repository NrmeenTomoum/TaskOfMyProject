//
//  HomeViewController.swift
//  Task
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//

import UIKit
import AVKit
protocol HomeDisplayLogic: class
{
//  func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
  var videos: [Video] = []
  let tableView = UITableView()
  let VideoCellReuseIdentifier = "VideoCell"
    
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.videos = Video.allVideos()
    self.interactor?.setVedios()
    loadViews()
  }
  
  func loadViews() {
    view.backgroundColor = .white
    
    tableView.register(VideoTableViewCell.classForCoder(), forCellReuseIdentifier: VideoCellReuseIdentifier)
    tableView.delegate = self
    tableView.dataSource = self
    
    view.addSubview(tableView)
     }
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    tableView.frame = view.bounds
    
   }
//  // MARK: View lifecycle
//  
//  override func viewDidLoad()
//  {
//    super.viewDidLoad()
//    doSomething()
//  }
  
//  // MARK: Do something
//
//  //@IBOutlet weak var nameTextField: UITextField!
//
//  func doSomething()
//  {
//    let request = Home.Something.Request()
//    interactor?.doSomething(request: request)
//  }
//
//  func displaySomething(viewModel: Home.Something.ViewModel)
//  {
//    //nameTextField.text = viewModel.name
//  }
}


extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseIdentifier, for: indexPath) as? VideoTableViewCell else {
      return VideoTableViewCell()
    }
    cell.video = videos[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let video = videos[indexPath.row]
    return VideoTableViewCell.height(for: video)
  }
  
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    router?.routedetailsVedioVC()
//    //2 Create an AVPlayerViewController and present it when the user taps
//    let video = videos[indexPath.row]
//
//    let videoURL = video.url
//    let player = AVPlayer(url: videoURL)
//    let playerViewController = AVPlayerViewController()
//    playerViewController.player = player
//  
//    present(playerViewController, animated: true) {
//      player.play()
//    }
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}
