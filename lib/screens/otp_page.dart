import 'package:flutter/material.dart';
import 'package:optipace/services/otp_api.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {

  String? mobileNumber;

  OtpPage(String? mobileNumber){
    this.mobileNumber=mobileNumber;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: ImageIcon(
                      AssetImage("assets/icons/backarrow.png"),
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),

              SizedBox(height: height*0.15,),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 150,
                      alignment: Alignment.center,
                      child: Image.asset('assets/icons/lockicon.png'),
                    ),
                  )
                ],
              ),

              SizedBox(height: height*0.05,),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "OTP Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                        ),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: height*0.02,),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                            'Enter the otp',
                          ),
                        )
                    ),
                   ]
                  ),

              SizedBox(height: height*0.06,),

              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 30,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: Colors.white,
                ),
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) async {
                  try {
                    var response = await OtpApi().checkOtp(mobileNumber!,pin,context);
                  } catch  (e) {
                    print(e);
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
