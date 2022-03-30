// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({ Key? key }) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentStep =0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Widget App"),
//       ),
//       body: Center(
//         child: Stepper(
//           steps: [
//             Step(title: Text("Step1"),          
//              content: Text("Information of 1st step")
//              ),

//               Step(title: Text("Step2"),          
//              content: Text("Information of 2nd step")
//              ),
//               Step(title: Text("Step3"),          
//              content: Text("Information of 3rd step")
//              )
//           ],
//           onStepTapped: (int newIndex){
//             setState(() {
//               _currentStep = newIndex;
//             });
//           },

//           currentStep: _currentStep,
//           onStepContinue: (){
//             if (_currentStep !=2){
//               setState(() {
//                 _currentStep +=1;
//               });
//             }
//           },

//           onStepCancel: (){
//             if(_currentStep !=0){
//               setState(() {
//                 _currentStep -=1;
//               });
//             }
//           },
          
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget"),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context,
             delegate: CustomSearchDeligate(),);
          }, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

class CustomSearchDeligate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Water Melon',
    'Oranges',
    'Mangoes',
    'BlueBerries',
    'Strawberries',
    'Raspberries',
  ];
  @override
  List<Widget> buildActions (BuildContext context){
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear))
    ];
  }

   @override
  Widget buildLeading (BuildContext context){

    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back),);
  }

   @override
  Widget buildResults (BuildContext context){
    List <String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,
    itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },
    );
  }

   @override
  Widget buildSuggestions (BuildContext context){
    List <String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,
    itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },
    );
  }
}