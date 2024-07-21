
import Foundation

final class ProfileImageService {
    static let shared = ProfileImageService()
    static let didChangeNotification = Notification.Name(rawValue: "ProfileImageProviderDidChange")
    private let urlSession = URLSession.shared
    private (set) var avatarURL: String?
    private var task: URLSessionTask?
    
    private init() {}
    
    func fetchProfileImageURL(username: String, completion: @escaping (Result<String, Error>) -> Void) {
        //  assert(Thread.isMainThread)
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.fetchProfileImageURL(username: username, completion: completion)
            }
            return
        }
        
        guard task == nil else {return}
        var request = URLRequest.makeHTTPRequest(path: "/users/\(username)", httpMethod: "GET")
        //request.setValue("Bearer \(OAuth2TokenStorage().token!)", forHTTPHeaderField: "Authorization")
        guard let token = OAuth2TokenStorage().token else {
            completion(.failure(NSError(domain: "TokenErrorDomain", code: 2, userInfo: [NSLocalizedDescriptionKey: "No OAuth token available."])))
            return
        }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        let task = urlSession.objectTask(for: request) { [weak self] (result: Result<UserResult, Error>) in
            guard let self = self else { return }
            //            switch result {
            //            case .success(let userResult):
            //                self.avatarURL = userResult.profileImage["large"]
            //                completion(.success(self.avatarURL!))
            //                NotificationCenter.default
            //                    .post(
            //                        name: ProfileImageService.didChangeNotification,
            //                        object: self,
            //                        userInfo: ["URL": self.avatarURL!])
            //            case .failure(let error):
            //                self.task = nil
            //                completion(.failure(error))
            //            }
            //        }
            //        self.task = task
            //        task.resume()
            //    }
            //}
            DispatchQueue.main.async {
                switch result {
                case .success(let userResult):
                    // Безопасное извлечение URL изображения профиля
                    if let avatarURL = userResult.profileImage["large"] {
                        self.avatarURL = avatarURL
                        completion(.success(avatarURL))
                        NotificationCenter.default.post(
                            name: ProfileImageService.didChangeNotification,
                            object: self,
                            userInfo: ["URL": avatarURL])
                    } else {
                        completion(.failure(NSError(domain: "ParseErrorDomain", code: 4, userInfo: [NSLocalizedDescriptionKey: "No profile image URL found."])))
                    }
                case .failure(let error):
                    self.task = nil
                    completion(.failure(error))
                }
            }
        }
        
        self.task = task
        task.resume()
    }
}
            
extension ProfileImageService {
  private struct UserResult: Codable {
      var profileImage: [String: String]
    }
}

