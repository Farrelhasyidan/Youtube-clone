//
//  ViewController.swift
//  Youtube clone
//
//  Created by Farrel hasyidan on 15/03/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, ModelDelegate, UITableViewDelegate {

  
  var model = Model()
  var videos = [Video]()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    //set itself as datasource and delegate
    tableView.dataSource = self
    tableView.delegate = self
    
    //setitself as delegateof the model
    model.delegate = self
    
    model.getVideo()
  }
  
  func videosFatched(_ videos: [Video]) {
    self.videos = videos
    
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Contsants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
    
    let video = self.videos[indexPath.row]
    
    cell.setCell(video)
    
    return cell
    
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard tableView.indexPathForSelectedRow != nil else {
      return
    }
    
    let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
    
    let detailVC = segue.destination as! DetailViewController
    
    detailVC.video = selectedVideo
  }
}

