//
//  CommentViewModel.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/30.
//

import Combine
import SwiftUI
import CombineMoya
import Moya

public class CommentViewModel: ObservableObject {
    
    var commentCancellable: AnyCancellable?
    @Published var commentModel: CommentModel?
    
    func toViewModel(_ list: CommentModel) {
        self.commentModel = list
    }
    
    func requestCommentList(postId : Int) {
        if let cancellable = commentCancellable {
            cancellable.cancel()
        }
        let provider = MoyaProvider<CommentService>(plugins: [MoyaLoggingPlugin()])
        
        commentCancellable = provider.requestWithProgressPublisher(.commentList(postId: postId))
            .compactMap { $0.response?.data }
            .receive(on: DispatchQueue.main)
            .decode(type: CommentModel.self, decoder: JSONDecoder())
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
                    print("댓글 통신 성공 \(String(describing: model.data?.comments))")
                } else if model.code == NetworkCode.netWorkError.description {
                    
                }
            })
    }
}
