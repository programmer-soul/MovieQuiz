//
//  NetworkClient.swift
//  MovieQuiz
//
//

import Foundation

struct NetworkClient {

    private enum NetworkError: Error {
        case codeError
    }
 
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        print("📡 Отправляю запрос: \(request.url?.absoluteString ?? "")")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Ошибка сети: \(error.localizedDescription)")
                handler(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse {
                print("📬 Ответ сервера: \(response.statusCode)")
                if response.statusCode < 200 || response.statusCode >= 300 {
                    handler(.failure(NetworkError.codeError))
                    return
                }
            }

            guard let data = data else {
                print("⚠️ Пустой ответ")
                return
            }

            print("✅ Данные получены: \(data.count) байт")
            handler(.success(data))
        }

        task.resume()
    }
}
