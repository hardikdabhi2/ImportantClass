//
//  CoreDataManager.swift
//  RequiredClass
//
//  Created by Hardik on 15/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared:CoreDataManager = CoreDataManager()
    
    private var context:NSManagedObjectContext{
        return StructConst.appDelegate.persistentContainer.viewContext
    }
    
    func storeStudentData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Student")
        
        let manager = NSEntityDescription.insertNewObject(forEntityName: "Student", into:self.context) as! Student
        do{
            manager.name = "Hardik"
            manager.school = "BVM"
            manager.subject = "Science"
            
            try self.context.save()
        }
        catch{
            print("Error",error.localizedDescription)
        }
    }
    
    
}
