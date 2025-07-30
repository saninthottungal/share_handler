import share_handler_ios_models
    
class ShareViewController: ShareHandlerIosViewController {
    public override func viewDidLoad() {
        super.viewDidLoad();

        // load group and app id from build info
                loadIds();
    
    
        
        Task {
            await handleInputItems()
        }
    }
}
