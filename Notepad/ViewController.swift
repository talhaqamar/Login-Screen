//
//  ViewController.swift
//  Notepad
//
//  Created by Talha Qamar on 10/20/14.
//  Copyright (c) 2014 Talha Qamar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var textusername : UITextField!
    @IBOutlet weak var textpassword : UITextField!
    
    @IBAction func load()
    {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@",textusername.text as String)
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        if(results.count > 0)
        {   var res = results[0] as NSManagedObject
            textusername.text = res.valueForKey("username") as String
            textpassword.text = res.valueForKey("password") as String           // for res in results{ println(res) }
        }

        else { println("error") }
    }
    
    @IBAction func save()
    {   var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUSer = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUSer.setValue(""+textusername.text, forKey: "username")
        newUSer.setValue(""+textpassword.text, forKey: "password")
        context.save(nil)
        println("save")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

