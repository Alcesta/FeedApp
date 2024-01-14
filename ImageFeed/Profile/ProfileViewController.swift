import UIKit

final class ProfileViewController: UIViewController{
    
    private var profileImageVar: UIImageView?
    private var userNameVar: UILabel?
    private var userLoginVar: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProfileImageView()
        createUserNameLabel()
        createUserLoginLabel()
        createUserMessageLabel()
        createLogoutButton()
    }
    
    private func createProfileImageView() {
        let imageView = UIImageView(image: UIImage(named: "Avatar"))
        
        imageView.layer.cornerRadius = 35
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.profileImageVar = imageView
    }
    
    private func createUserNameLabel() {
        let username = UILabel()
        
        username.translatesAutoresizingMaskIntoConstraints = false
        username.textAlignment = .left
        username.text = "Ольга Илюшина"
        username.textColor = UIColor(named: "YP White")
        username.font = UIFont.boldSystemFont(ofSize: 23)
        view.addSubview(username)
        username.topAnchor.constraint(equalTo: self.profileImageVar!.bottomAnchor, constant: 8).isActive = true
        username.leadingAnchor.constraint(equalTo: profileImageVar!.leadingAnchor).isActive = true
        username.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        self.userNameVar = username
    }
    
    private func  createUserLoginLabel() {
        let userLogin = UILabel()
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        userLogin.textAlignment = .left
        userLogin.text = "@olgailulu"
        userLogin.textColor = UIColor(named: "YP Gray")
        userLogin.font = UIFont.systemFont(ofSize: 13)
        view.addSubview(userLogin)
        
        userLogin.topAnchor.constraint(equalTo: userNameVar!.bottomAnchor, constant: 8).isActive = true
        userLogin.leadingAnchor.constraint(equalTo: userNameVar!.leadingAnchor).isActive = true
        userLogin.trailingAnchor.constraint(equalTo: userNameVar!.trailingAnchor).isActive = true
        self.userLoginVar = userLogin
    }
    
    private func createUserMessageLabel() {
        let userMessage = UILabel()
        userMessage.translatesAutoresizingMaskIntoConstraints = false
        userMessage.textAlignment = .left
        userMessage.text = "Avada Kedavra!"
        userMessage.textColor = UIColor(named: "YP White")
        userMessage.font = UIFont.systemFont(ofSize: 13)
        view.addSubview(userMessage)
        
        userMessage.topAnchor.constraint(equalTo: userLoginVar!.bottomAnchor, constant: 8).isActive = true
        userMessage.leadingAnchor.constraint(equalTo: userNameVar!.leadingAnchor).isActive = true
        userMessage.trailingAnchor.constraint(equalTo: userNameVar!.trailingAnchor).isActive = true
        
    }
    
    private func createLogoutButton() {
        let logoutButton = UIButton()
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setImage(UIImage(named: "Logout"), for: .normal)
        logoutButton.addTarget(self, action: #selector(Self.didTapLogoutButton), for: UIControl.Event.touchUpInside)
        view.addSubview(logoutButton)
        
        logoutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
        logoutButton.leadingAnchor.constraint(greaterThanOrEqualTo: profileImageVar!.trailingAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc
    private func didTapLogoutButton() {
        
    }
}
