
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:optipace/screens/otp_page.dart';


class LoginApi {

  Dio _dio = Dio();
  final _baseUrl = 'http://demosrvr2.optipacetech.com:8082/citizen/mob/api/checkmobilenumbergetOtp';

   sentOtp(String mobileNumber,BuildContext context) async{
    var response = await _dio.get(_baseUrl+'/$mobileNumber');
    print(response.data);
    if(response.data['code'] != 1){
      final snackBar = SnackBar(
        content: Text("${response.data['message']}"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(mobileNumber)));
    }
  }


}
