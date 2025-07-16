//
//  DatabaseRLMFile.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 18/09/24.
//

import Foundation
import RealmSwift

class RealmPantryData : Object{
   
    @Persisted var taskName : String
    @Persisted var taskDate = Date()    
}
