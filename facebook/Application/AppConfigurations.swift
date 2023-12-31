import Foundation

final class AppConfiguration {
    var baseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String else {
            fatalError("BaseUrl must not be empty in plist")
        }
        return apiBaseURL
    }()

}
