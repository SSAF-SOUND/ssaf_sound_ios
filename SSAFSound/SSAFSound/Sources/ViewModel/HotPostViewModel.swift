//
//  HotPostViewModel.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/20.
//

import Combine
import SwiftUI
import CombineMoya
import Moya

class HotPostViewModel: ObservableObject {
    
    var hotPostCancellable: AnyCancellable?
    @Published var hotPostModel: HotPostModel?
    
    func toViewModel(_ list: HotPostModel) {
        self.hotPostModel = list
    }
    
    func requestHotPostList() {
        if let cancellable = hotPostCancellable {
            cancellable.cancel()
        }
        
        let provider = MoyaProvider<HotPostService>(plugins: [MoyaLoggingPlugin()])
        
        hotPostCancellable = provider.requestWithProgressPublisher(.hotPost(cursor: -1, size: 10))
            .compactMap { $0.response?.data }
            .receive(on: DispatchQueue.main)
            .decode(type: HotPostModel.self, decoder: JSONDecoder())
//            .sink(receiveCompletion: { [weak self] result in
//                switch result {
//                case .finished:
//                    break
//                case .failure(let error) :
//                    print("Network Error \(error.localizedDescription)")
//                }
//            }, receiveValue: { [weak self] model in
//                self?.toViewModel(model)
//                print("핫게시글 \(model)")
//            })
            .sink(receiveCompletion: { result in
                switch result {
                    //MARK: -  성공 했을때
                case .finished:
                    break
                    //MARK: - 네트워크 통신 에러 관려
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }, receiveValue: { [weak self] model in
                if model.code == NetworkCode.sucess.description {
                    self?.toViewModel(model)
                    print("핫게시판 통신 성공 \(String(describing: model.data?.posts))")
                } else if model.code == NetworkCode.netWorkError.description {
                    
                }
            })

    }
}
