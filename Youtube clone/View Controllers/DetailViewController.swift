//
//  DetailViewController.swift
//  Youtube clone
//
//  Created by Farrel hasyidan on 19/03/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var dateLabel: UILabel!
  
  @IBOutlet weak var webView: WKWebView!
  
  @IBOutlet weak var textView: UITextView!
  
  var video:Video?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // kita bersihkan hal2 berikut
    titleLabel.text = ""
    dateLabel.text = ""
    textView.text = ""
    
    guard video != nil else {
      return
    }
    
    // membuat embed url (https://youtube.com/embed/ + video.id)
    let embedUrlString = Contsants.YT_EMBED_URL + video!.videoId
    
    // ngeload video kr webview
    let url = URL(string: embedUrlString)
    let request = URLRequest(url: url!)
    webView.load(request)
    
    // ngeset title
    titleLabel.text = video!.title
    
    // ngeset tanggal
    let df = DateFormatter()
    df.dateFormat = "EEEE, MMM d, yyyy"
    
    dateLabel.text = df.string(from: video!.published)
    
    // ngeset description
    textView.text = video!.description
  }
  
  
}
