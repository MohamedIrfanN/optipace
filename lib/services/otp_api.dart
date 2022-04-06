
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:optipace/screens/home_page.dart';
import 'package:optipace/screens/otp_page.dart';


class OtpApi {

  Dio _dio = Dio();
  final _baseUrl = 'http://demosrvr2.optipacetech.com:8082/citizen/mob/api/matchOTPNew';

  checkOtp(String mobileNumber,String otp,BuildContext context) async{
    print(mobileNumber);
    print(otp);
    Map<dynamic,String> data = {
      "mobilenum" : mobileNumber,
      "otp" : otp
    };
    var response = await _dio.post(_baseUrl,data: data);
    print(response.data);
    if(response.data['code'] != 1){
      final snackBar = SnackBar(
        content: Text("${response.data['message']}"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else {
      print("hii");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()),(Route<dynamic> route) => false);
    }
  }


}