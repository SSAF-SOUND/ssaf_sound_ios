//
//  BoardViewModel2.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/08/10.
//

import Combine
import SwiftUI
import CombineMoya
import Moya

public class BoardViewModel2: ObservableObject {
    
    
    public init() {
        requestBoard()
    }
    
    var boardCancellable: AnyCancellable?
    @Published var boardModel: BoardModel?
    
    
    func toViewModel(_ list: BoardModel) {
        self.boardModel = list
    }
    
    
    func requestBoard() {
        //MARK: -  통신 취소 관련
        if let cancellable = boardCancellable {
            cancellable.cancel()
        }
        //MARK: - Moya는 Provider 객체와 TargetType(서비스)만 있으면 네트워크 통신을 할 수 있습니다.
        let provider = MoyaProvider<BoardService2>(plugins: [MoyaLoggingPlugin()])
        
        boardCancellable = provider.requestWithProgressPublisher(.boards)
        //MARK: -  모델 map 타입
            .compactMap { $0.response?.data }
    //MARK: - 데이터 통신 쓰레드
            .receive(on: DispatchQueue.main)
        //MARK:  decode 타입
            .decode(type: BoardModel.self, decoder: JSONDecoder())
       //MARK: - sink(receiveValue:) 를 이용하여 publisher로부터 받은 값을 관찰하고 console에 프린트 해보겠습니다.
//        먼저 아래의 예제에서는, publisher가 범위를 int로 설정하여 sink(receiveCompletion: receiveValue:) publish 하고 있고 receiveValue를 클로저를 통해서 콘솔에 프린트 하고 있습니다.
//        완료시에 sink(receiveCompletion: receiveValue:) operator의 receiveCompletion 클로저는 stream이 성공적으로 종료되었음을 알려줍니다.
            .sink(receiveCompletion: { result in
                switch result {
                    //MARK: -  성공 했을때
                case .finished:
                    break
                    //MARK: - 네트워크 통신 에러 관려
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                //MARK: -  성공후 통신 작업 값을 받을 때 실행하는 클로저 입니
            }, receiveValue: { [weak self] model in
                if model.code == NetworkCode.sucess.description {
                    self?.toViewModel(model)
                    print("게시판  통신 성공 \(model)")
                }
            })
    }
    
}

