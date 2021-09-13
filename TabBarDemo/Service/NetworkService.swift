//
//  NetworkService.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import Foundation

private let networkServiceName = "NetworkService"

extension ServiceRegistryImplementation {
    var networkService: NetworkService {
        get {
            return serviceWith(name: networkServiceName) as! NetworkService
        }
    }
}

protocol NetworkService: Service {
    func getArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void)
    func getMarkets(completion: @escaping (Result<CurrencyResponse, Error>) -> Void)
}

enum DemoUrl {
    case articles
    case markets
}

let baseURL = "https://content.dailyfx.com/api/v1/"

extension NetworkService {
    var serviceName: String {
        get {
            return networkServiceName
        }
    }
    
    private func urlFor(serviceName: DemoUrl) -> URL? {
        switch serviceName {
        case .articles:
            return URL(string: baseURL + "dashboard")
        case .markets:
            return URL(string: baseURL + "markets")
        }
    }
        
    func getArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void) {
        guard let url = urlFor(serviceName: .articles) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ArticleResponse.self, from: data!)
                completion(.success(response))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
    
    func getMarkets(completion: @escaping (Result<CurrencyResponse, Error>) -> Void) {
        guard let url = urlFor(serviceName: .markets) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(CurrencyResponse.self, from: data!)
                completion(.success(response))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
}

internal class NetworkServiceImplementation: NetworkService {
    internal static func register() {
        ServiceRegistry.add(service: LazyService(serviceName: networkServiceName, serviceGetter: {
            NetworkServiceImplementation()
        }))
    }
}
