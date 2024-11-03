import UIKit

class RandomCatViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func getCatImage(_ sender: Any) {
        downloadCat()
    }
    
    private func downloadCat() {
        guard let url = URL(string: "https://cataas.com/cat") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                self?.catImage.image = UIImage(data: data)
            }
        }

        task.resume()
    }
}
