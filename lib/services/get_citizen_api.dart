import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:optipace/screens/otp_page.dart';

import '../model/citizen_model.dart';

class CitizenApi {
  Dio _dio = Dio();
  final _baseUrl =
      'http://demosrvr2.optipacetech.com:8082/citizen/mob/api/citizentypeList';

  Future<CitizenModel?> getCitizen(BuildContext context) async {
    CitizenModel? citizenModel;
    try {
      var response = await _dio.get(_baseUrl);
      print(response.data);
      citizenModel = CitizenModel.fromJson(response.data);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,

          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

      if (e.response != null) {



        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return citizenModel;
  }
}
