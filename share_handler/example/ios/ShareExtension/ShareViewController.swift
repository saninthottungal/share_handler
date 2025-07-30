import UIKit
import share_handler_ios_models
    
class ShareViewController: ShareHandlerIosViewController {
    private var didShowSheet = false
    
    public override func viewDidLoad() {
        super.viewDidLoad();

        // load group and app id from build info
                loadIds();
    

     
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showActionSheet()

     
    }
    

    
    private func showActionSheet() {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Add to status", style: .default, handler: { _ in
                
                super.shareTarget = "status"
                self.completeRequest()
            }))

            alert.addAction(UIAlertAction(title: "Create post", style: .default, handler: { _ in
                super.shareTarget = "post"
                self.completeRequest()
            }))

            alert.addAction(UIAlertAction(title: "Send message", style: .default, handler: { _ in
                super.shareTarget = "message"
                self.completeRequest()
            }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            super.shareTarget = nil
            super.extensionContext?.completeRequest(returningItems: nil)
        }))

            // Present the alert
            self.present(alert, animated: true, completion: nil)
        }
    
    func completeRequest(){
        Task{
            await handleInputItems()
            extensionContext?.completeRequest(returningItems: nil)
        }
    }
}

