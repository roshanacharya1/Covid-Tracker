import 'package:get/get.dart';
import 'package:covid_tracker_beta/Models/StatesData.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class StateDataController extends GetxController{
  var statesData =List<StatesData>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData()async{
    final response= await http.get('https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true');
    final Data=jsonDecode(response.body);
    for(var u in Data){
      print(u);
    }


  }

}