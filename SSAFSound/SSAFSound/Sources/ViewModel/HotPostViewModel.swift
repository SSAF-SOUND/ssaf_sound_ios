//
//  HotPostViewModel.swift
//  SSAFSound
//
//  Created by Subeen on 2023/08/20.
//

import Foundation
import Combine
import CombineMoya
import Moya
import SwiftUI

class HotPostViewModel: ObservableObject {
    @Published var hotPostModel: HotPostModel?
    var hotPostCancellable: AnyCancellable?
    
    func getHotPostToViewModel(_ list: HotPostModel) {
        self.hotPostModel = list
    }
    
    func hotPostResponse() {
        if let cancellable = hotPostCancellable {
            cancellable.cancel()
        }
        
        let provider = MoyaProvider<HotPostService>()
        hotPostCancellable = provider.requestPublisher(.hotPost(cursor: -1, size: 10))
            .compactMap { $0.data }
            .receive(on: DispatchQueue.main)
            .decode(type: HotPostModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error) :
                    print("Network Error \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] model in
                self?.getHotPostToViewModel(model)
                print("핫게시글 \(model)")
            })

    }
}
