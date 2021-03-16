//
//  Model.swift
//  Youtube clone
//
//  Created by Farrel hasyidan on 15/03/21.
//

import Foundation

class Model {
  
  // buat fungsi untuk mengambil data dari youtube API
  func getVideo(){
    // simpan url ke dalam variabel
    let url = URL(string: Contsants.API_URL)
    
    // kita cek urlnya kosong tidak?
    guard url != nil else {
      return
    }
    
    // mendapatkan URLSession dari object
    let session = URLSession.shared
    
    // mendapatkan data dari URLSession
    let dataTask = session.dataTask(with: url!){ (data, response, error) in
      
      // cek jika ada error
      if error != nil || data == nil{
        return
      }
      
      do {
        // memasukan data ke dalam project video
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Response.self, from: data!)
        
        dump(response)
      }
      catch{
        
      }
    }
    // mulai kerja
    dataTask.resume()
  }
}
