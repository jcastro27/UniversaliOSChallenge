//
//  ViewController.swift
//  UniveraliOSChallenge1.1
//
//  Created by Joseph Castro on 6/14/22.
//

import UIKit




class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var arr = [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        
        guard let url = URL.init(string: strUrlTodos) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, errorRespose in

            
            if data != nil && errorRespose == nil {
                let j = JSONDecoder.init()
            
                
                do {
                    let objcontact = try j.decode(Contact.self, from: data!)
                    self.arr = objcontact.results
                    print(self.arr.first ?? 0, self.arr.last ?? 0)
                    
                    
                    DispatchQueue.main.async {
                        self.tblView.reloadData()
                    }
                    
                } catch (let decodeError){
                    print(decodeError)
                }
            } else {
            }
        }.resume()
        
        print("1")
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ContactCell
        
        cell?.title.text = arr[indexPath.row].name.title + " " + arr[indexPath.row].name.first + " " +  arr[indexPath.row].name.last
        cell?.title.text = arr[indexPath.row].name.title + " " + arr[indexPath.row].name.first + " " +  arr[indexPath.row].name.last
        ImageDownloader.shared.getImage(url: arr[indexPath.row].picture.thumbnail) { image in
            DispatchQueue.main.async {
                cell?.userImage.image = image
            }
        }

      
        
        return cell!
    }
    
    
}
class ImageDownloader {
    static let shared = ImageDownloader()
    private init() {}
    let imageCache = NSCache<NSString, UIImage>()

    func getImage(url: String?, completion:@escaping (UIImage) -> ()) {
        guard let url = url else {
            completion(UIImage(named: "template")!)
            return
        }

        if let cached = imageCache.object(forKey: url as NSString) {
            completion(cached)
        }

        DispatchQueue.global(qos: .background).async {
            if let dataUrl = URL(string: url) {
                do {
                    let data = try Data(contentsOf: dataUrl)
                    if let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: url as NSString)
                        completion(image)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(UIImage(named: "template")!)
            }
        }
    }
}




class APIHandler {
    
    static let shared = APIHandler.init()
    private init() {}
}
