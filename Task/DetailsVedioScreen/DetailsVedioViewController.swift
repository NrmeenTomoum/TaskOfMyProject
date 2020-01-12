//
//  DetailsVedioViewController.swift
//  Task
//
//
//
//  Created by Nrmeen Tomoum on 12/01/2020.
//  Copyright © 2020 Nermeen. All rights reserved.
//


import UIKit

protocol DetailsVedioDisplayLogic: class
{
 func displayVideoInfo(response video:Video )
}

class DetailsVedioViewController: UIViewController, DetailsVedioDisplayLogic
{
  var interactor: DetailsVedioBusinessLogic?
  var router: (NSObjectProtocol & DetailsVedioRoutingLogic & DetailsVedioDataPassing)?
 
    var videoPreviewLooper : VideoLooperView?
    @IBOutlet weak var titleOfVedio: UILabel!
    
    @IBOutlet weak var descriptionOfVedio: UILabel!
    // MARK: Object lifecycle
  
    @IBOutlet weak var linkOfVideo: UILabel!
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
    let interactor = DetailsVedioInteractor()
    let presenter = DetailsVedioPresenter()
    let router = DetailsVedioRouter()
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
  
  // MARK: View lifecycle

  override func viewDidLoad() {
     super.viewDidLoad()
    self.interactor?.setValues()

    loadViews()
   }
   
   func loadViews() {
     view.backgroundColor = .white
    view.addSubview(videoPreviewLooper!)
   }
   override func viewWillLayoutSubviews() {
     super.viewWillLayoutSubviews()
     
    videoPreviewLooper!.frame = CGRect(x: 0, y:100, width: view.bounds.width , height: 200)
    videoPreviewLooper!.backgroundColor = .black
   }
    
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
func displayVideoInfo(response video:Video )
{
    videoPreviewLooper = VideoLooperView(video: video)
    titleOfVedio.text = video.title
    descriptionOfVedio.text = "Description dummy data" + video.subtitle
    linkOfVideo.text = video.thumbURL
}
}
