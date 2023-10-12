//
//  LunchViewModel.swift
//  SSAFSound
//
//  Created by Subeen on 2023/09/21.
//

import Combine
import SwiftUI
import CombineMoya
import Moya

public class LunchViewModel: ObservableObject {
    
    var lunchCancellable: AnyCancellable?
    @Published var lunchModel: LunchModel?
    
    func toViewModel(_ list: LunchModel) {
        self.lunchModel = list
    }
    
    func requestBoard() {
        //MARK: - 통신 취소 관련
        if let cancellable = lunchCancellable {
            cancellable.cancel()
        }
        
        let provider = MoyaProvider<LunchService>(plugins: [MoyaLoggingPlugin()])
        
        lunchCancellable = provider.requestWithProgressPublisher(.lunchs(date: "2023-09-22", campus: "서울"))
            .compactMap { $0.response?.data }
            .receive(on: DispatchQueue.main)
            .decode(type: LunchModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { result in
                switch result {
                    // MARK: - 성공
                case .finished:
                    break
                    // MARK: - 네트워크 통신 에러
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                // MARK: 성공 후 통신 작업 값을 받을 때 실행
            }, receiveValue: { [weak self] model in
                if model.code == NetworkCode.sucess.description {
                    self?.toViewModel(model)
                    print("점심 메뉴 통신 성공 \(model)")
                }
            })
    }
}
