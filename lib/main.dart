import  'package:flutter/material.dart';
import  'dart:convert';
import './pages/Details.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

void main()=> runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.green,

  ),

  home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  List data;
  var diseaseData;
  var searchRes;

  @override
  void  initState() {
    super.initState();
   /*  new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('data/disease.json'),
            builder: (context, snapshot){
              diseaseData = json.decode(snapshot.data.toString());
              searchRes = diseaseData;
              }
            ); */ 
           this.loadAsset();
            

           
           
  }

Future<String> loadAsset() async {
  
  var jsonString = await rootBundle.loadString('data/disease.json');
  setState((){ diseaseData = json.decode(jsonString); searchRes = diseaseData;});
  return "success";
   
}
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Diseases'),
      ),

      body: Padding(
      padding: const EdgeInsets.all(8.0),
      // creating a column with the single value field and a list of Textfields
      child: Column(
        children: <Widget>
        [
          
           new TextField(
                decoration: new InputDecoration(
                  hintText: "Search..."
                ),
                onChanged: (String str)=> _getList(str)
              ), 
      

          new Expanded(
            child:  new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                 
                  var intro = diseaseData[index]['introduction'];
                  var name = diseaseData[index]['name'];
                  
                  return new ListTile(
                    onTap: (){
                       var route = new MaterialPageRoute(
                        builder: (BuildContext context)=> new Disease.fromJson(diseaseData[index])
                      );
                      Navigator.of(context).push(route); 
                     },
                    leading: new CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: new Text(name.substring(0,1))
                    ),
                    title: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text(diseaseData[index]['name'], style: new TextStyle(fontWeight: FontWeight.bold)
                          )
                          ),
                         
                          
                      ],
                    ),
                    
                    subtitle: new Text(intro.substring(0, 90) + "...")
                    
                    
                  );
                  
                },
                
                itemCount:diseaseData == null ? 0 : diseaseData.length
              ),
            
          )
          
        ],
      ),
    ),
      
    );
  }

 _getList(String search){
 this.setState((){
                diseaseData = searchRes;
                });
   if(search != ""){
                print("search");
                print(search);
             
              var searchOutput =diseaseData.where((i){
                search = search.toLowerCase();
                var name = i["name"].toLowerCase();
                var symptoms = i["symptoms"].toLowerCase();
                return  (name.indexOf(search) != -1 || symptoms.indexOf(search)  != -1); 
                 }).toList();
                
      this.setState((){
        diseaseData = searchOutput;
      });
     
    }else{
          this.setState((){
                diseaseData = searchRes;
                });
              }

}
}