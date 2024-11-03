import UIKit

class RandomCatWithTextViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var catText: UITextField!
    @IBOutlet weak var catWithTextImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catText.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    
    @IBAction func getCatImage(_ sender: Any) {
        downloadCat(with: catText.text ?? "")
    }
    
    private func downloadCat(with text: String) {
        guard let url = URL(string: "https://cataas.com/cat/says/\(text)?fontSize=50&fontColor=white") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                self?.catWithTextImage.image = UIImage(data: data)
            }
        }

        task.resume()
    }
    
}
