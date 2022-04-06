import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:optipace/services/login_api.dart';
class LoginInPage extends StatelessWidget {


  TextEditingController mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),

          child: Column(
            children: [

              SizedBox(height: height*0.3),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Log In",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                ],
              ),


              SizedBox(height: height*0.04,),

              _formField(hintText: "Mobile number",controller: mobileNumberController),



              SizedBox(height: height*0.05,),

              _signInButton(context),



            ],
          ),
        )
    );
  }


  _signInButton(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              if(_formKey.currentState!.validate()) {
                LoginApi().sentOtp(mobileNumberController.text, context);
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.2),
              padding: EdgeInsets.symmetric(vertical: height*0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                    color: Colors.grey[500]!,
                    blurRadius: 3.0,
                  ),]
              ),
              child: Center(child: Text("LOG IN",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w600),)),
            ),
          ),
        ),
      ],
    );
  }


  _formField({required String hintText,required TextEditingController controller}) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.grey[900]),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF009fff),),
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF009fff),),
                borderRadius: BorderRadius.circular(5.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[700]),
              hintText: hintText,
              fillColor: Colors.grey[300]),
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: "Required"),
                ]
            ),
            keyboardType: TextInputType.number
        ),
      ),
    );
  }




}

