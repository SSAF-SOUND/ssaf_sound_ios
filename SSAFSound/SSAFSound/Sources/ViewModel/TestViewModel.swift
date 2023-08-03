//
//  TestViewModel.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/08/03.
//

//import Foundation
//import Combine
//import SwiftUI
//import Service
//import Model
//import Moya
//import CombineMoya
//import DesignSystem
//import API
//import Authorization
//
//public class CharagingHistoryViewModel: ObservableObject {
//
//    @Published public var charageHistoryModel: ChargingHistoryModel?
//    var charageHistoryCancellable: AnyCancellable?
//    @Published public var charageHistoyLoading: Bool = false
//
//    @Published public var charageHistoryDetailModel: CharagingHistoryDetailModel?
//    var charageHistoryDetailCancellable: AnyCancellable?
//
//    var authSetting: AuthSetting = AuthSetting()
//
//    var charagingHistoryInfo: CharagingHistoryInfo = CharagingHistoryInfo()
//
//    public init() {
//
//    }
//
//    func toCharageHistoryToViewModel(_ list: ChargingHistoryModel) {
//        self.charageHistoryModel = list
//    }
//
//    public func requestCharageHistory(startDate: String, endDate: String) {
//        if let cancellable = charageHistoryCancellable {
//            cancellable.cancel()
//        }
//
//        let provider = MoyaProvider<CharageHistoryService>(plugins: [MoyaLoggingPlugin()])
//        charageHistoryCancellable =
//        provider.requestWithProgressPublisher(.charageStationHistory(memberId: authSetting.memberId, st: startDate, et: endDate))
//            .compactMap { $0.response?.data }
//            .receive(on: DispatchQueue.main)
//            .decode(type: ChargingHistoryModel.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//            .sink(receiveCompletion: { [weak self] result in
//                switch result {
//                case .finished:
//                    break
//                case .failure(let error):
//                    self?.charagingHistoryInfo.errorMesage = error.localizedDescription
//                    self?.charagingHistoryInfo.loading = true
//                    self?.charagingHistoryInfo.showPOPUP = true
//                    print("네트워크 에러 \(self?.charagingHistoryInfo.errorMesage)")
//                }
//            }, receiveValue: { [weak self] model in
//                if model.code == NetworkCode.sucess.description {
//                    self?.toCharageHistoryToViewModel(model)
//                    print("충전이력 조회 \(model)")
//                    self?.charageHistoyLoading = false
//                    self?.charagingHistoryInfo.showPOPUP = false
//                } else if model.code == NetworkCode.serverError.description {
//                    self?.toCharageHistoryToViewModel(model)
//                    print("충전이력 조회 \(model)")
//                    self?.charageHistoyLoading = true
//                    self?.charagingHistoryInfo.showPOPUP = true
//                }
//            })
//    }
//
//    func toCHarageHistoryDetailToViewModel(_ list: CharagingHistoryDetailModel) {
//        self.charageHistoryDetailModel = list
//    }
//
//    func requestCharageHistoryDetail(sessionId: String) {
//        if let cancellable = charageHistoryDetailCancellable {
//            cancellable.cancel()
//        }
//
//        let provider = MoyaProvider<CharageHistoryService>(plugins: [MoyaLoggingPlugin()])
//        charageHistoryDetailCancellable = provider.requestWithProgressPublisher(.charageStationHistoryDetail(sessionId: sessionId))
//            .compactMap { $0.response?.data }
//            .receive(on: DispatchQueue.main)
//            .decode(type: CharagingHistoryDetailModel.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//            .sink(receiveCompletion: { [weak self] result in
//                switch result {
//                case .finished:
//                    break
//                case .failure(let error):
//                    self?.charagingHistoryInfo.errorMesage = error.localizedDescription
//                    self?.charagingHistoryInfo.loading = true
//                    self?.charagingHistoryInfo.showPOPUP = true
//                    print("네트워크 에러 \(self?.charagingHistoryInfo.errorMesage)")
//                }
//            }, receiveValue: { [weak self] model in
//                if model.code == NetworkCode.sucess.description {
//                    self?.toCHarageHistoryDetailToViewModel(model)
//                    print("충전이력 상세 조회 \(model)")
//                }
//            })
//    }
//
//}
//
