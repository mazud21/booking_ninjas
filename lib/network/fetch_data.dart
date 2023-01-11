import 'dart:developer';

import 'package:booking_ninjas/models/flightModel.dart';
import 'package:booking_ninjas/models/model_task.dart';
import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FetchData extends ChangeNotifier{

  List<Airline> _dataAirline = [];
  List<Airline> get dataAirline => _dataAirline;

  List<ModelTask> _dataTask = [];
  List<ModelTask> get dataTask => _dataTask;

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
          print('GET_PAGE_DATA0: $result');

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
          print('GET_DETAIL_DATA0: $result');

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

  getListTask() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var bearerToken = prefs.getString('session_id');
    var endpoint = prefs.getString('org_url');
    var contactId = prefs.getString('contact_id');

    Map<String, String> requestHeaders = {
      //'Authorization': 'Bearer $bearerToken'
      'Authorization': 'Bearer 00D6D00000037nc!AQcAQNY1wS3O_cihoN284N1VVpkvg0.YLj8z1JJZkOUV3rsrpbdNGAKk3jlrMuJQGV9d8jiamr67PN9aDBRZsHqoWPDaSBJQ'
    };

    //final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/$contactId";
    const url = "https://nosoftware-app-2024-dev-ed.scratch.my.salesforce.com/services/apexrest/bn2gpv1/Housekeeping/0036D00000hoWTWQA2";

    try{

      final response = await http.get(Uri.parse(url), headers: {'Authorization': 'Bearer 00D6D00000037nc!AQcAQNY1wS3O_cihoN284N1VVpkvg0.YLj8z1JJZkOUV3rsrpbdNGAKk3jlrMuJQGV9d8jiamr67PN9aDBRZsHqoWPDaSBJQ'});

      print('GET_DATA_DEFAULT: ${response.statusCode} ${response.body}');

      try {
        if (response.statusCode == 200) {

          var result = ModelTask.fromJson(json.decode(response.body));
          print('GET_PAGE_DATA0: $result');

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

  Future<List<ModelTask>> getListTask2() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var bearerToken = prefs.getString('session_id');
    var endpoint = prefs.getString('org_url');
    var contactId = prefs.getString('contact_id');

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $bearerToken'
      //'Authorization': 'Bearer 00D6D00000037nc!AQcAQNY1wS3O_cihoN284N1VVpkvg0.YLj8z1JJZkOUV3rsrpbdNGAKk3jlrMuJQGV9d8jiamr67PN9aDBRZsHqoWPDaSBJQ'
    };

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/$contactId";
    //const url = "https://nosoftware-app-2024-dev-ed.scratch.my.salesforce.com/services/apexrest/bn2gpv1/Housekeeping/0036D00000hoWTWQA2";

    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode == 200) {
      final result = json.decode(response.body).cast<Map<String, dynamic>>();
      print('RESPONSE_CEK_TASK : ${json.decode(response.body)}');
      _dataTask = result.map<ModelTask>((json) => ModelTask.fromJson(json)).toList();
      return _dataTask;
    } else {
      throw Exception();
    }
  }

  postStatusTask(String taskId, String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var bearerToken = prefs.getString('session_id');
    var endpoint = prefs.getString('org_url');

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $bearerToken'
      //'Authorization': 'Bearer 00D6D00000037nc!AQcAQNY1wS3O_cihoN284N1VVpkvg0.YLj8z1JJZkOUV3rsrpbdNGAKk3jlrMuJQGV9d8jiamr67PN9aDBRZsHqoWPDaSBJQ'
    };

    checkStatus(){

      ///"Confirmed" -> petugas mengkonfirmasi untuk menerima task
      /// "In Progress" -> mulai mengerjakan task
      /// "Completed" -> selesai (edited)

      if(status == 'Pending'){
        return 'Confirmed';
      } else if(status == 'Confirmed'){
        return 'In Progress';
      } else if(status == 'In Progress') {
        return 'Completed';
      }
    }

    Map<String, String> bodyData = {
      "task_id" : /*"a0W6D000008NjQuUAK"*/taskId,
      "status" : /*"Confirmed"*/checkStatus().toString()
    };

    var body = json.encode({
      "task_id": /*"a0W6D000008NjQuUAK"*/taskId,
      "status": /*"Confirmed"*/checkStatus().toString()
    });

    log('GET_STATUS: $status $taskId ${checkStatus().toString()} ${bearerToken} ${endpoint}');

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/";
    //const url = "https://nosoftware-app-2024-dev-ed.scratch.my.salesforce.com/services/apexrest/bn2gpv1/Housekeeping/0036D00000hoWTWQA2";

    try {

      final response = await http.put(Uri.parse(url), headers: requestHeaders, body: body);
      log('TASK_UPDATE:  ${response.statusCode} ${response.body}');

      if (response.statusCode == 200) {
        var result = response.body.toString();

        if(result == 'true'){
          Get.snackbar('Task', 'Task has been updated', colorText: PalletColors.text_white, backgroundColor: PalletColors.btn_green);
        } else {
          Get.snackbar('Task', 'Task not updated', colorText: PalletColors.text_white, backgroundColor: PalletColors.btn_red);
        }

      } else {
        Get.snackbar('Error', 'Error on server side', backgroundColor: PalletColors.btn_red);
      }
    } on Exception catch (_) {
      print("throwing new error");
      Get.snackbar('Error', 'Error on server side', backgroundColor: PalletColors.btn_red);
      throw Exception("Error on server");
    }

  }
}