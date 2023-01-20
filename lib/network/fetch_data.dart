import 'dart:developer';

import 'package:booking_ninjas/models/flightModel.dart';
import 'package:booking_ninjas/models/model_task_assign.dart';
import 'package:booking_ninjas/models/model_task_confirm.dart';
import 'package:booking_ninjas/models/model_task_confirm.dart';
import 'package:booking_ninjas/models/model_task_confirm.dart';
import 'package:booking_ninjas/models/model_task_confirm.dart';
import 'package:booking_ninjas/models/model_task_confirm.dart';
import 'package:booking_ninjas/models/model_task_general.dart';
import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FetchData extends ChangeNotifier{

  late String contactId;

  List<ModelTaskGeneral> _dataTaskGeneral = [];
  List<ModelTaskGeneral> get dataTaskGeneral => _dataTaskGeneral.where((element) => element.status == 'Pending'/* && element.performerId == 'null'*/).toList();

  List<ModelTaskAssign> _dataTaskAssign = [];
  List<ModelTaskAssign> get dataTaskAssign => _dataTaskAssign.where((element) => element.status == 'Pending' && element.performerId != 'null').toList();

  List<ModelTaskConfirm> _dataTaskConfirm = [];
  List<ModelTaskConfirm> get dataTaskConfirm => _dataTaskConfirm.where((element) => element.status == 'Confirmed' || element.status == 'In Progress').toList();

  getListTask() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var bearerToken = prefs.getString('session_id');
    var endpoint = prefs.getString('org_url');
    var contactId = prefs.getString('contact_id');

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $bearerToken'
    };

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/$contactId";

    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    log('GET_DATA_TASK_GENERAL: ${response.body.toString()}');

    if (response.statusCode == 200) {

      final result = json.decode(response.body).cast<Map<String, dynamic>>();

      _dataTaskGeneral = result.map<ModelTaskGeneral>((json) => ModelTaskGeneral.fromJson(json)).toList();
      return _dataTaskGeneral;

    } else {
      throw Exception();
    }
  }

  getListTaskAssign() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var bearerToken = prefs.getString('session_id');
    var endpoint = prefs.getString('org_url');
    contactId = prefs.getString('contact_id')!;

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $bearerToken'
    };

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/$contactId";

    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    log('GET_DATA_TASK_ASSIGN: ${response.body.toString()}');

    if (response.statusCode == 200) {

      final result = json.decode(response.body).cast<Map<String, dynamic>>();

      _dataTaskAssign = result.map<ModelTaskAssign>((json) => ModelTaskAssign.fromJson(json)).toList();
      return _dataTaskAssign;

    } else {
      throw Exception();
    }
  }

  getListTaskConfirm() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var bearerToken = prefs.getString('session_id');
    var endpoint = prefs.getString('org_url');
    var contactId = prefs.getString('contact_id');

    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $bearerToken'
    };

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/$contactId";

    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    log('GET_DATA_TASK_CONFIRM: ${response.body.toString()}');

    if (response.statusCode == 200) {

      final result = json.decode(response.body).cast<Map<String, dynamic>>();

      _dataTaskConfirm = result.map<ModelTaskConfirm>((json) => ModelTaskConfirm.fromJson(json)).toList();
      return _dataTaskConfirm;

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

    var body = json.encode({
      "task_id": taskId,
      "status": checkStatus().toString()
    });

    log('GET_STATUS: $status $taskId ${checkStatus().toString()} ${bearerToken} ${endpoint}');

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/";

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

  postStatusTaskDetail(String taskId, String status, String cleaningTask, String room, String floor, String building) async {
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

    var body = json.encode({
      "task_id": taskId,
      "status": checkStatus().toString()
    });

    log('GET_STATUS: $status $taskId ${checkStatus().toString()} ${bearerToken} ${endpoint}');

    final url = "https://$endpoint/services/apexrest/bn2gpv1/Housekeeping/";

    try {

      final response = await http.put(Uri.parse(url), headers: requestHeaders, body: body);
      log('TASK_UPDATE:  ${response.statusCode} ${response.body}');

      if (response.statusCode == 200) {
        var result = response.body.toString();

        if(result == 'true'){
          Get.snackbar('Task', 'Task has been updated', colorText: PalletColors.text_white, backgroundColor: PalletColors.btn_green);

          ///use for fill current task
          prefs.setString('idCT', taskId);
          prefs.setString('statusCT', status);
          prefs.setString('cleaningCT', cleaningTask);
          prefs.setString('roomCT', room);
          prefs.setString('floorCT', floor);
          prefs.setString('buildingCT', building);

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