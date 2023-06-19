import UIKit

typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

protocol APIClient {
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
}

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    var url: String { get }
    var path: String { get }
    var httpMethod: String { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    var queries: [String: String] { get }
    var timeout: TimeInterval { get }
}

protocol APIResponse: Decodable {
    
}

struct GitHubRepository: Decodable {
    let id: Int
    let name: String
    let full_name: String
    let language: String
    let visibility: String
    let watchers: Int
}

struct GitHubUserRequest: APIRequest {
    typealias Response = GitHubRepository
    
    var url: String {
        return "https://api.github.com/users/git-air/repos"
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var body: Data? {
        return nil
    }
    
    var queries: [String : String] {
        return [:]
    }
    
    var timeout: TimeInterval {
        return 60
    }
    
}

