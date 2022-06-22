//
//  HomeBodyPopUpView.swift
//  Kaleub
//
//  Created by Hamlit Jason on 2022/06/23.
//

import SwiftUI

struct HomeBodyPopUpView: View {
    let type: PopUpType
    
    @State var name: String = ""
    @State var password: String = ""
    
    enum PopUpType {
        case create
        case join
        
        var item: [String] {
            switch self {
            case .create:
                return [
                    "CREATE THE ROOM",
                    "새로운 방을 만들어\n친구를 초대하자!",
                    "방 제목을 입력해 주세요. (4~6)",
                    "비밀번호를 설정해주세요. (4~12)"
                ]
            case .join:
                return [
                    "JOIN THE ROOM",
                    "친구들과 추억이 담긴 방\n참여해 볼 수 있어!",
                    "초대코드를 입력해 주세요.",
                    "비밀번호를 입력해 주세요.(4~12)"
                ]
            }
        }
    }
    
    init(_ type: PopUpType) {
        self.type = type
    }
    
    /*  NOTE: background vs overlay
     background: 해당 뷰보다 뒤에 위치
     overlay: 해당 뷰보다 앞에 위치
     overlay하면 텍스트필드가 안먹힐 수 있다.
     */
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 320, height: 237)
                .foregroundColor(.white)
                .overlay {
                    VStack(alignment: .center) {
                        Text(type.item[0])
                            .padding(.top, 20)
                            .padding(.bottom, 12)
                            .font(.system(size: 20))
                        Text(type.item[1])
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 16))
                        TextField("", text: $name)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        Text(type.item[2])
                                            .font(.system(size: 12))
                                    }
                            }
                            .padding([.horizontal], 27)
                        TextField("", text: $password)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(ColorSet.primary)
                                    .background {
                                        Text(type.item[3])
                                            .font(.system(size: 12))
                                    }
                            }
                            .padding([.horizontal], 27)
                        
                        Spacer()
                    }
                }
            
            Button {
                // TODO: cancel
            } label: {
                Image("app.xmark")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(18)
            }
        }
        
    }
}

struct HomeBodyPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBodyPopUpView(.create)
    }
}