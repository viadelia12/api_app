import 'dart:convert';

import 'package:get_rest_api/get_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Covid> data = [];
  _getCovidData() async{
    try{
      var response = await get(Uri.parse("https://data.covid19.go.id/public/api/prov.json"));
      print(response.statusCode);
      print(response.body);
      List list_data = (json.decode(response.body) as Map<String, dynamic>)['list_data'];
      list_data.forEach((element) {
        data.add(Covid.fromJson(element));
      });
    }catch(e){
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kasus COVID-19"),
      ),
      body: FutureBuilder(
        future: _getCovidData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.separated(
              itemBuilder: (context, index){
                return Container(
                  child: Text(data[index].key,
                    style: TextStyle(
                      fontFamily: 'SimplyRounded',
                      fontSize: 20,
                    ),
                  ),
                );
              }, 
              separatorBuilder: (context, index){
                return Divider();
              }, 
              itemCount: 34
            );
          }
        }
      ),
    );
  }
}