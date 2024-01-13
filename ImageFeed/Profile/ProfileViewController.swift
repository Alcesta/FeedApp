import UIKit

final class ProfileViewController: UIViewController{
    @IBOutlet weak var superview: UIView!
    private var subviews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage()
        userName()
        userLogin()
        userMessage()
        logoutButton()
    }
    
    private func profileImage() {
        let image = UIImage(named: "Avatar")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        subviews.append(imageView)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 76),
            imageView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16)
        ])
    }
    
    private func userName() {
        let username = UILabel()
        username.translatesAutoresizingMaskIntoConstraints = false
        username.textAlignment = .left
        username.text = "Ольга Илюшина"
        username.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        username.font = UIFont.boldSystemFont(ofSize: 23)
        subviews.append(username)
        view.addSubview(username)
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: subviews[0].bottomAnchor, constant: 8),
            username.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16)
        ])
    }
    
    private func userLogin() {
        let userLogin = UILabel()
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        userLogin.textAlignment = .left
        userLogin.text = "@olgailulu"
        userLogin.textColor = UIColor(red: 0.682, green: 0.686, blue: 0.706, alpha: 1)
        userLogin.font = UIFont.systemFont(ofSize: 13)
        subviews.append(userLogin)
        superview.addSubview(userLogin)
        NSLayoutConstraint.activate([
            userLogin.topAnchor.constraint(equalTo: subviews[1].bottomAnchor, constant: 8),
            userLogin.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16)
        ])
    }
    
    private func userMessage() {
        let userMessage = UILabel()
        userMessage.translatesAutoresizingMaskIntoConstraints = false
        userMessage.textAlignment = .left
        userMessage.text = "Avada Kedavra!"
        userMessage.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        userMessage.font = UIFont.systemFont(ofSize: 13)
        subviews.append(userMessage)
        superview.addSubview(userMessage)
        NSLayoutConstraint.activate([
            userMessage.topAnchor.constraint(equalTo: subviews[2].bottomAnchor, constant: 8),
            userMessage.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16)
        ])
    }
    
    private func logoutButton() {
        let logoutButton = UIButton(type: .custom)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("", for: .normal)
        logoutButton.setImage(UIImage(named: "Logout"), for: .normal)
        subviews.append(logoutButton)
        superview.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: superview.topAnchor, constant: 89),
            logoutButton.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16)
        ])
    }
}
