import 'package:flutter/material.dart';

class Disease extends StatelessWidget{
  //Constructor
  int id;
  String introduction;
  String causes;
  String prevention;
  String treatment;
  String name;
  String diagnosing;
  String source;
  String symptoms;

  Disease.fromJson(Map json){
    print(json);
    this.id = json['id'];
    this.introduction = json['introduction'];
    this.causes = json['causes'];
    this.prevention = json['prevention'];
    this.treatment = json['treatment'];
    this.name = json['name'];
    this.diagnosing = json['diagnosing'];
    this.source = json['source'];
    this.symptoms = json['symptoms'];

  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     
      appBar: new AppBar(
        title: new Text(this.name),
      ),

       body:
           Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 10.0, left: 10.0, right:10.0),
            child: new Column(
                children: <Widget>[
                  new ListView(
                    children: <Widget>[
                   new Column(
                      children: <Widget> [
                          new Text("Introduction"),
                          new Text(this.introduction),
                      ]
                      ),
                 
                    ],
                  )
                  
                ],
              ),
            
           )
   );  
  }

}