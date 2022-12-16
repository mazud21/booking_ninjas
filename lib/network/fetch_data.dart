import 'dart:developer';

import 'package:booking_ninjas/models/flightModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchData extends ChangeNotifier{

  List<Airline> _dataAirline = [];
  List<Airline> get dataAirline => _dataAirline;

  getListFlight() async {

    /*Map<String, String> requestHeaders = {
      'Authorization': 'Bearer ${tokenIzin.toString()}',

    };*/

    const url = "https://api.instantwebtools.net/v1/passenger?page=0&size=10";

    try{

      final response = await http.get(Uri.parse(url)/*, headers: requestHeaders*/);

      try {
        if (response.statusCode == 200) {

          var result = FlightModel.fromJson(json.decode(response.body));
          print('GET_PAGE_DATA0: ' + result.toString());

          return result;
        } else {
          debugPrint('statusSEARCH_cek_URL: ');
        }
      } on http.ClientException {
        print("throwing new error");
        throw Exception("Error on server");
      }

    } on Exception catch (e){
      log('ERROR_DATA: $e');

    }
  }

  Future<List<Airline>> fetchAirline() async {

    const url = "https://api.instantwebtools.net/v1/passenger?page=0&size=10";

    final response = await http.get(Uri.parse(url));
    print(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body)['data'][0]['airline'].cast<Map<String, dynamic>>();
      print('RESPONSE_CEK_MEMO : ${json.decode(response.body)}');
      _dataAirline = result.map<FlightModel>((json) => FlightModel.fromJson(json)).toList();
      return _dataAirline;
    } else {
      throw Exception();
    }
  }

  getDetailPassenger(String id) async {

    final url = "https://api.instantwebtools.net/v1/passenger?id=$id";

    try{

      final response = await http.get(Uri.parse(url)/*, headers: requestHeaders*/);

      try {
        if (response.statusCode == 200) {

          var result = FlightModel.fromJson(json.decode(response.body)['data'][0]);
          print('GET_DETAIL_DATA0: ' + result.toString());

          return result;
        } else {
          debugPrint('statusSEARCH_cek_URL: ');
        }
      } on http.ClientException {
        print("throwing new error");
        throw Exception("Error on server");
      }

    } on Exception catch (e){
      log('ERROR_DATA: $e');

    }
  }
}