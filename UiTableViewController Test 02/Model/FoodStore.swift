//
//  FoodStore.swift
//  UiTableViewController Test 02
//
//  Created by amadeus on 2018. 6. 11..
//  Copyright © 2018년 lse. All rights reserved.
//

import Foundation
class FoodStore {
    var name: String = ""
    var image: String = ""
    var address: String = ""
    var tel: String = ""
    var menu: String = ""
    var type: String = ""
    
    init(name: String, image: String, address: String, tel: String, menu: String, type: String) {
        self.name = name
        self.image = image
        self.address = address
        self.tel = tel
        self.menu = menu
        self.type = type
    }
    
    class func generateModelArray() -> [FoodStore]{
        var modelAry = [FoodStore]()
        
        modelAry.append(FoodStore(name: "늘해랑", image: "01", address: "부산광역시 부산진구 양정1동 350-1", tel: "051-863-6997", menu: "수육백반, 돼지국밥, 순대국밥, 내장국밥", type: "돼지국밥집"))
        modelAry.append(FoodStore(name: "번개반점", image: "02", address: "부산광역시 부산진구 양정동 418-282", tel: "051-852-9969", menu: "짜장면, 짬뽕, 짬짜면, 탕수육, 탕짜면, 군만두, 양장피", type: "중화요리"))
        modelAry.append(FoodStore(name: "아딸", image: "03", address: "부산광역시 부산진구 양정동 393-18", tel: "051-852-9969", menu: "떡볶이, 오뎅, 떡강정, 핫도그, 튀김", type: "분식점"))
        modelAry.append(FoodStore(name: "왕짜장", image: "04", address: "부산광역시 부산진구 양정1동 356-22", tel: "051-863-6997", menu: "짜장면, 짬뽕, 짬짜면, 탕수육, 볶짜면, 군만두, 양장피", type: "중화요리"))
        modelAry.append(FoodStore(name: "토마토 도시락", image: "05", address: "부산광역시 부산진구 양정1동 산19-8", tel: "051-863-6997", menu: "치킨마요, 참치마요, 돈불와퍼, 돈치와퍼, 돈까스카레", type: "도시락"))
        modelAry.append(FoodStore(name: "홍콩반점", image: "06", address: "부산광역시 부산진구 양정동 353-38", tel: "051-863-6997", menu: "짬뽕, 짜장면, 짬뽕밥, 볶음밥, 탕수육, 군만두", type: "중화요리"))


        
        return modelAry
    }
    
//    convenience init() {
//        self.init(name: "", image: "", address: "", tel: "", menu: "")
//    }
}
