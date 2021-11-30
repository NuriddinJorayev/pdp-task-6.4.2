// ignore_for_file: unused_import

import 'dart:core';

import 'package:hive/hive.dart';
import 'package:task_6_4_2/model/user.dart';

class Hive_db {

  var db = Hive.box('hive1');
  
  // save
  setUser(String key, Map  map) {
    db.put(key, map);
  }

  // load
  Map  LoadUser(String key) {
    Map user = db.get(key);
    return user;

  }
}
