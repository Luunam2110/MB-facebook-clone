
import Foundation


final class LoginViewModel {
    var authUseCase: AuthUseCase
    
    var email: Observable<String>
    var error: Observable<String>

    init (){
        self.authUseCase = AppDIContainer.shared.resolve(AuthUseCase.self)
        self.email = Observable("")
        self.error = Observable("")
    }
    
    func login(_ email: String, _ password: String){
        authUseCase.login(request: LoginRequest(useName: email, password: password)) { result in
            switch result {
            case .success(let res) :
                self.email.value = res.email
            case .failure(let err) :
                self.error.value = err.message
            }
        }
    }
    
}
