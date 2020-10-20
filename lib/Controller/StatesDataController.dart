import 'package:get/get.dart';
import 'package:covid_tracker_beta/Models/StatesData.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:flutter/material.dart';
class StateDataController extends GetxController{
var statesData =List<StatesData>().obs;

var CactivCases=0.obs;
var CNactiveCases=0.obs;
var CTrecovered=0.obs;
var CNrecovered=0.obs;
var CTdeaths=0.obs;
var CNdeaths=0.obs;
var CTases=1.obs;



@override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData()async{
  final response= await http.get('https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true');
 final Data=jsonDecode(response.body);
  List<StatesData> Sdata;
  //print(Data['activeCases']);
  var CactivCasesqw=Data['activeCases'];
  CNactiveCases.value=Data['activeCasesNew'];
  CTrecovered.value=Data['recovered'];
  CNrecovered.value=Data['recoveredNew'];
  CTdeaths.value=Data['deaths'];
  print('$CTdeaths');
  CNdeaths.value=Data['deathsNew'];
  CTases.value=Data['totalCases'];
  CactivCases.value=CactivCasesqw;
print(CactivCases);
 for(var u in Data['regionData']){

   statesData.add(StatesData(Region:u['region'],NDead:u['newDeceased'] ,TDead:u['deceased'] ,Tinfected:u['totalInfected'] ,Trecovered:u['recovered'] ,Ninfected:u['newInfected'] ,Nrecovered:u['newRecovered']  ));
   }


}

}
