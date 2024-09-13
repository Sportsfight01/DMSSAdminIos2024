//
//  DataModule.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 02/09/24.
//

import Foundation

struct categoriesData {
    var name : String
    var type : String
    var image : String
    
}


struct pantryData{
    // date taken as today
    // check time as Int 1hr - 24hr
    
    var categoryName : String
    var subname : String
    var type : String
    var date = Date()
    var status : String
    var area : String
    var checkTime : Int
}

struct  PantryEntityData{
        var office_machine:String
        var water_dispenser:String
        var cupboards:String
        var wooden_frames_glassses:String
        var water_glass:String
        var cookies:String
        var refrigrator:String
        var floor_wall_tiles:String
        var bar_tables_chains:String
        var steel_dustbins:String
        var pril_liquid:String
        var h_k_bor_signature:String
        var h_K_sup_signature:String
        var refregerator_cleening:String
        var oven_cleaning:String
        var sink_cleaning:String
        var snacks:String
       
    
    
}



struct Product {
    var quantity: Int
    var name: String
    var image: String
}

class Database {
    let product1 = Product(quantity: 12, name: "super product one", image: "sun.min.fill")
    let product2 = Product(quantity: 24, name: "super product 2", image: "sun.min.fill")
    lazy var productList: [Product] = {
        return [product1, product2]
    }()
}
