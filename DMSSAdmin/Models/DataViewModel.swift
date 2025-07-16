//
//  DataViewModel.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 11/09/24.
//

import Foundation

class pantryDataViewModel {
    
    var PantryEntityData = [pantryData]()
    
    func addPantryData(data : [pantryData]) -> [pantryData]{
         PantryEntityData.append(contentsOf: data)
        return PantryEntityData
    }
}

let pantryArr =  [pantryData(categoryName: "Pantry", subname: "office_machine", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "water_dispenser", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "cupboards", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "wooden_frames_glassses", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "water_glass", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "refrigrator", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "floor_wall_tiles", type: "", date: Date(), status: "", area: "", checkTime: 1),                                pantryData(categoryName: "Pantry", subname: "bar_tables_chains", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "pril_liquid", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "steel_dustbins", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "h_k_bor_signature", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "h_K_sup_signature", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "refregerator_cleening", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "oven_cleaning", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "sink_cleaning", type: "", date: Date(), status: "", area: "", checkTime: 1),
                             pantryData(categoryName: "Pantry", subname: "snacks", type: "", date: Date(), status: "", area: "", checkTime: 1)]
