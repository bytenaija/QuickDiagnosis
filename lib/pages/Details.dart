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
        title: new Text(this.name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
      ),

       body:
           Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 30.0, left: 10.0, right:10.0),
            child: 
                  new ListView(
                    children: <Widget>[
                          new Text("Introduction", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.greenAccent)),
                          new Divider(color:Colors.green),
                          new Text(this.introduction, style: new TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
                          new Divider(color:Colors.green),
                          new Text("Causes", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.greenAccent)),
                          new Divider(color:Colors.green),
                          new Text(this.causes, style: new TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
                          new Divider(color:Colors.green),
                          new Text("Symptoms", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.greenAccent)),
                          new Divider(color:Colors.green),
                          new Text(this.symptoms, style: new TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
                          new Divider(color:Colors.green),
                          new Text("Prevention", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.greenAccent)),
                          new Divider(color:Colors.green),
                          new Text(this.prevention, style: new TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
                          new Divider(color:Colors.green),
                          new Text("Diagnosing", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.greenAccent)),
                          new Divider(color:Colors.green),
                          new Text(this.diagnosing, style: new TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
                          new Divider(color:Colors.green),
                          new Text("Treatment", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.greenAccent)),
                          new Divider(color:Colors.green),
                          new Text(this.treatment, style: new TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
                          new Divider(color:Colors.green),
                          new Column(
                            children: <Widget>[
                              new Text("Source: " + this.source, style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0, color: Colors.red )),
                            ],
                          )

                      ]
                      ),
                 
                
            
           )
   );  
  }

}