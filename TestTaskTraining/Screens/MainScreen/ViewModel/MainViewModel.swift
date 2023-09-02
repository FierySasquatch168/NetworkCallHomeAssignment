//
//  MainViewModel.swift
//  TestTaskTraining
//
//  Created by Aleksandr Eliseev on 01.09.2023.
//

import Foundation
import Combine

protocol MainViewModelProtocol {
    var visibleObjectsPublisher: CurrentValueSubject<[VisibleNumberModel], Never> { get }
}

final class MainViewModel: MainViewModelProtocol {
    var visibleObjectsPublisher = CurrentValueSubject<[VisibleNumberModel], Never>([])
    
    private var cancellables = Set<AnyCancellable>()
    
    private let networkService: NetworkService
    private let endPoint: EndPointValue
    
    init(networkService: NetworkService, endPoint: EndPointValue) {
        self.networkService = networkService
        self.endPoint = endPoint
        
        sendRequest()
    }
}

// MARK: - Ext SendRequest
private extension MainViewModel {
    func sendRequest() {
        let request = RequestCreator.createGetRequest(endPoint: endPoint)
        networkService.networkPublisher(request: request, type: ResponseModel.self)
            .flatMap({ self.getNumberModelPublisher($0) })
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { [weak self] numberModel in
                self?.visibleObjectsPublisher.send(numberModel)
            }.store(in: &cancellables)


    }
    
    func getNumberModelPublisher(_ responseModel: ResponseModel) -> AnyPublisher<[VisibleNumberModel], Never> {
        responseModel.numbers.publisher
            .map({ $0.number })
            .collect()
            .map({ generateVisibleNumberModel($0) })
            .eraseToAnyPublisher()
    }
}

// MARK: - Ext VisibleModelCreation
private extension MainViewModel {
    func generateVisibleNumberModel(_ model: [Int]) -> [VisibleNumberModel] {
        model.map { number in
            return isOrange(model: model, number: number) ?
            VisibleNumberModel(number: number, height: 50, color: K.hexOrange) : VisibleNumberModel(number: number, height: 100, color: K.hexRed)
        }
    }
    
    func isOrange(model: [Int], number: Int) -> Bool {
        !model.contains(-number) || number == 0
    }
}
