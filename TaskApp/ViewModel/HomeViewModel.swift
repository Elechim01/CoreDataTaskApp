//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by Michele on 13/01/21.
//

import SwiftUI
import CoreData
class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date  = Date()
//    Per un nuovo data sheet
    @Published var isNewData = false
//    Checking and update Date ..
//    Storing Update Item
    @Published var updateItem : Task!
    
    
    let calender = Calendar.current
    
    func CheckDate() -> String {
        if calender.isDateInToday(date){
            return "Today"
        }else if(calender.isDateInTomorrow(date)){
            return "Tomorrow"
        }else{
            return "Other day"
        }
    }
    func updateDate(value : String){
        if value == "Today"{date = Date()}
        else if value == "Tomorrow"{
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }
        else{
//        do something 
        }
    }
    func writeData(context: NSManagedObjectContext){
//        Task perchè il task si chiama tesk
//        Updating Item
        if updateItem != nil{
//            Means Update Old Data...
            updateItem.date = date
            updateItem.content = content
            try! context.save()
//            Rimozione dell'updatingItem if sucess
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        let newTask = Task(context: context)
        print(date)
        newTask.date = self.date
        newTask.content = self.content
//        Saving Data
        do {
            try context.save()
//            succes means closing view..
            isNewData.toggle()
            content = ""
            date = Date()
        } catch  {
            print(error.localizedDescription)
        }
    }
    func EditItem(item: Task){
        
        updateItem = item
//        togging the newDataView
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
    
}
