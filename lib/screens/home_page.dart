import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:optipace/model/citizen_model.dart';
import 'package:optipace/services/get_citizen_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Citizens",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
        centerTitle: true,
      ),
      body: SafeArea(child: citizenList(context)),
    );
  }

  Widget citizenList(BuildContext context) {
    return FutureBuilder<CitizenModel?>(
      future: CitizenApi().getCitizen(context),
      builder: (context, snapshot) {
        final citizens = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            }
            else {
              return buildCitizenList(citizens!);
            }
        }
      },
    );
  }


  Widget buildCitizenList(CitizenModel citizens) {
    return ListView.builder(
        //physics:  NeverScrollableScrollPhysics(),
        itemCount: citizens.data!.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: GestureDetector(
              onTap: (){
                showAlertDialog(context,citizens,index);
              },
              child: ClayContainer(
                borderRadius: 20,
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(flex:1,child: Text("Name:",style: TextStyle(fontWeight: FontWeight.w700,),)),
                            SizedBox(width: 5,),
                            Expanded(flex:2,child: Text(citizens.data![index].name!,)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(flex:1,child: Text("Image:"),),
                            SizedBox(width: 5,),
                            Expanded(flex:2,child: Text(citizens.data![index].image!))
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(flex:1,child: Text("Available:"),),
                            SizedBox(width: 5,),
                            Expanded(flex:2,child: Text(citizens.data![index].available!.toString()))
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(flex:1,child: Text("Order Status:"),),
                            SizedBox(width: 5,),
                            Expanded(flex:2,child: Text(citizens.data![index].citizenTypeId!.toString()))
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }


  showAlertDialog(BuildContext context, CitizenModel citizens,int index) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Citizen Details",style: TextStyle(color: Colors.black)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(flex:1,child: Text("Name:",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),)),
              SizedBox(width: 5,),
              Expanded(flex:2,child: Text(citizens.data![index].name!,style: TextStyle(color: Colors.black),)),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(flex:1,child: Text("Image:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700)),),
              SizedBox(width: 5,),
              Expanded(flex:2,child: Text(citizens.data![index].image!,style: TextStyle(color: Colors.black)))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(flex:1,child: Text("Available:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700)),),
              SizedBox(width: 5,),
              Expanded(flex:2,child: Text(citizens.data![index].available!.toString(),style: TextStyle(color: Colors.black)))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(flex:1,child: Text("Order Status:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700)),),
              SizedBox(width: 5,),
              Expanded(flex:2,child: Text(citizens.data![index].citizenTypeId!.toString(),style: TextStyle(color: Colors.black)))
            ],
          ),


        ],
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
