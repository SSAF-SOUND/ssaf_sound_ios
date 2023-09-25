//
//  PostWriteView.swift
//  SSAFSound
//
//  Created by yimkeul on 2023/07/25.
//


import SwiftUI
import PhotosUI

struct PostWriteView: View {

    @State var postWriteTitle: String = ""
    @State var postWriteContent: String = ""
    @State var isAnonymity: Bool = true
    @StateObject private var viewModel = PhotoPickerViewModel()
    @State private var showingAlert = false

    @Environment(\.presentationMode) var presentationMode
    // MARK: postViewModel 데이터 집합
    @StateObject var postViewModel: PostViewModel = PostViewModel()

    var body: some View {
        VStack {
            customPostNavBar(title: "게시글 쓰기")
            postWriteTitleView()
            postWriteContentView()
            postWriteImageView()
        }

    }
    @ViewBuilder
    private func customPostNavBar(title: String) -> some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 14, height: 14)

            }.padding(.trailing, 30)

            Text(title)
                .manropeFont(family: .Bold, size: 16)
                .foregroundColor(.white)
            Spacer()
            if !postWriteTitle.isEmpty && !postWriteContent.isEmpty {
                Button {
                    Task {
                        print("submit")
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("완료")
                        .manropeFont(family: .Bold, size: 16)
                        .foregroundColor(.white)
                }
            } else {
                Text("완료")
                    .manropeFont(family: .Bold, size: 16)
                    .foregroundColor(.gray)
            }

        }
            .padding(.horizontal, 20)


    }

    @ViewBuilder
    private func postWriteTitleView() -> some View {
        VStack {
            TextField("", text: $postWriteTitle, prompt: Text("제목").foregroundColor(.bluegrey))
                .manropeFont(family: .Bold, size: 16)
                .foregroundColor(.basicWhite)
                .padding(.leading, 24)
                .padding(.vertical, 10)
                .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.basicWhite)
                , alignment: .top
            )


        }
    }

    @ViewBuilder
    private func postWriteContentView() -> some View {
        VStack {
            TextField("", text: $postWriteContent, prompt: Text("내용을 입력하세요").foregroundColor(.bluegrey), axis: .vertical)
                .foregroundColor(.white)
//                .lineLimit(20)
            .manropeFont(family: .Bold, size: 16)
                .padding(.horizontal, 24)
                .padding(.vertical, 10)
                .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.basicWhite)
                , alignment: .top
            )
            Spacer()
        }
    }

    @ViewBuilder
    private func postWriteImageView() -> some View {
        VStack(alignment: .leading) {
            if !viewModel.selectedImages.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 16) {
                        ForEach(viewModel.selectedImages, id: \.self) {
                            image in selectedImageRow(image: image)
                        }
                    }
                }
                    .padding(.bottom, 64)
            }

            HStack {
                if viewModel.selectedImages.count < 3 {
                    PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
                        Image(asset: .uploadImg)
                    }
                } else {
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(asset: .uploadImg)
                    }
                        .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("이미지 선택 제한"),
                            message: Text("최대 3개까지 이미지를 선택할 수 있습니다."),
                            dismissButton: .default(Text("확인"))
                        )
                    }
                }
                Spacer()
                
                Button {
                    print("anonymous toggle")
                    isAnonymity.toggle()
                } label: {
                    HStack(alignment: .center, spacing: 5) {
                        Image(systemName: isAnonymity ? "checkmark.square" : "square")
                        Text("익명")
                            .manropeFont(family: .Bold, size: 14)
                    }.foregroundColor(.basicWhite)
                }

            }
        }.padding(.horizontal, 32)
    }

    @ViewBuilder
    private func selectedImageRow(image: UIImage) -> some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 104, height: 104)
                .cornerRadius(12)

            Button(action: {
                viewModel.removeImage(image)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.basicWhite)
                    .font(.title2)
                    .padding(4)
            }
        }
    }
}

final class PhotoPickerViewModel: ObservableObject {
    @Published private(set) var selectedImage: UIImage? = nil
    @Published private(set) var selectedImages: [UIImage] = []
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }

    private func setImage(from selection: PhotosPickerItem?) {
        Task {
            do {
                let data = try await selection?.loadTransferable(type: Data.self)

                guard let data, let uiImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }

                selectedImage = uiImage
                selectedImages.append(selectedImage!)
            } catch {
                print(error)
            }
        }

    }

    fileprivate func removeImage(_ image: UIImage) {
        if let index = selectedImages.firstIndex(of: image) {
            selectedImages.remove(at: index)
        }
    }
}



struct PostWriteView_Previews: PreviewProvider {
    static var previews: some View {
        PostWriteView()
    }
}
