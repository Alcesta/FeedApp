
import Foundation
import ImageFeed
import UIKit

final class ProfilePresenterSpy: ProfilePresenterProtocol {
    var view: ImageFeed.ProfileViewControllerProtocol?
    var viewDidLoadCalled: Bool = false
    
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func makeAlert() -> UIAlertController {
            // Return a dummy UIAlertController or appropriate implementation for testing purposes.
            return UIAlertController(title: "Test Alert", message: "This is a test alert", preferredStyle: .alert)
        }
        
        func logout() {
            // Implementation for testing or dummy logout
        }
        
        func clean() {
            // Implementation for testing or dummy clean
        }
    }

