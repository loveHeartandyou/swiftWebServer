//
//  DBClient.swift
//  zhu
//
//  Created by 朱振华 on 2019/4/15.
//

import PerfectMongoDB

let client = try! MongoClient(uri: "mongodb://172.16.2.5")

let db = client.getDatabase(name: "huiji_core_mongodb")

let collention = db.getCollection(name: "b_user_info")
