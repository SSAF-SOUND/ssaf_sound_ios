//
//  PostViewModel.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/15.
//

import Combine
import SwiftUI
import CombineMoya
import Moya

public class PostViewModel: ObservableObject {
    
    var postCancellable: AnyCancellable?
    @Published var postModel: PostModel?
    
    func toViewModel(_ list: PostModel) {
        self.postModel = list
    }
    
    func requestPostList(boardId : Int) {
        if let cancellable = postCancellable {
            cancellable.cancel()
        }
        let provider = MoyaProvider<PostService>(plugins: [MoyaLoggingPlugin()])
        
        postCancellable = provider.requestWithProgressPublisher(.postList(boardId: boardId, cursor: -1, size: 10))
            .compactMap { $0.response?.data }
            .receive(on: DispatchQueue.main)
            .decode(type: PostModel.self, decoder: JSONDecoder())
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
                    print("게시판글 통신 성공 \(String(describing: model.data?.posts))")
                } else if model.code == NetworkCode.netWorkError.description {
                    
                }
            })
    }
    
    func requestPostDetail(postId : Int){
        if let cancellable = postCancellable {
            cancellable.cancel()
        }
        let provider = MoyaProvider<PostService>(plugins: [MoyaLoggingPlugin()])
        
        postCancellable = provider.requestWithProgressPublisher(.postDetail(postId: postId))
            .compactMap { $0.response?.data }
            .receive(on: DispatchQueue.main)
            .decode(type: PostModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { result in
                switch result {
                    //MARK: -  성공 했을때
                case .finished:
                    break
                    //MARK: - 네트워크 통신 에러 관려
                case .failure(let error):
                    print(error.localizedDescription)
                    print(error)
                }
                
            }, receiveValue: { [weak self] model in
                if model.code == NetworkCode.sucess.description {
                    self?.toViewModel(model)
                    print("게시판 세부 내용 통신 성공 \(String(describing: model.data?.post))")
                } else if model.code == NetworkCode.netWorkError.description {
                    print("게시판 세부 내용 통신 실패 \(String(describing: model.data?.post))")
                }
            })
    }
    
}
