import Foundation

import UIKit
import AVFoundation

class CameraView:UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .secondarySystemBackground

    }
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: UIImagePickerController!


    @IBAction func button(_ sender: Any) {

                if !UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let alertController = UIAlertController(title: nil, message: "Device has no camera.", preferredStyle: .alert)

                    let okAction = UIAlertAction(title: "Alright", style: .default, handler: { (alert: UIAlertAction!) in
                    })

                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let picker = UIImagePickerController()
                    picker.sourceType = .camera
                    picker.allowsEditing = true
                    picker.delegate = self
                    present(picker,animated: true)
                }
    }



}



extension CameraView: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           picker.dismiss(animated: true, completion: nil)

           guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
               return
           }
           imageView.image = image
    }
}
