import 'dart:io';

///Reads a json file as Text. It takes the name of the file as an argument 
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();