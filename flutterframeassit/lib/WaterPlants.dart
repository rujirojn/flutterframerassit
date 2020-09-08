import 'package:flutter/material.dart';
import 'package:flutterframeassit/main.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';

class WaterPlantsScreen extends StatefulWidget {
  const WaterPlantsScreen({ Key key }) : super(key: key);

  @override
  _WaterPlantsScreen createState() => _WaterPlantsScreen();
}

class _WaterPlantsScreen extends State<WaterPlantsScreen> {
  Widget build(BuildContext context) {
  Duration _duration = Duration(hours: 0, minutes: 0);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: DraggableScrollableSheet(
        builder: (context, scrollController){
          return Container(
            child: SingleChildScrollView(
              // controller: scrollController,// is lock ?
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Your Cards", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.black),),
                            // Text("2 Physical Card, and 1 Virtual Card", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  SizedBox(
                    height: 16,
                  ),


                  Container(
                    child: Text("Card Settings", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [BoxShadow(
                            color: Colors.grey[100],
                            spreadRadius: 10.0,
                            blurRadius: 4.5
                        )]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.mobile_screen_share,
                              color: Colors.lightBlue[900],
                            ),
                            SizedBox(
                              width: 16,
                            ),

                            Text("ATM Withdraws", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey[700]),)

                          ],
                        ),
                        Switch(
                          value: DataWaterPlants.switch1,
                          activeColor: Color.fromRGBO(50, 172, 121, 1),
                          onChanged: (_){update1();},
                        ),
                        // CupertinoSwitch(
                        //   value: true,
                        //   onChanged: (_) {},
                        // ),
                      ],
                    ),
                  ),Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [BoxShadow(
                            color: Colors.grey[100],
                            spreadRadius: 10.0,
                            blurRadius: 4.5
                        )]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                                        new Expanded(
                                          child: DurationPicker(
                                          duration: _duration,
                                          onChange: (val) {
                                            print(val);
                                            this.setState(() => _duration = val);
                                          },
                                          snapToMins: 5.0,
                                        ))
                                      ],
                    ),
                  )


                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 245, 248, 1),
              borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40))
            ),
          );
        },
        initialChildSize: 0.95,
        maxChildSize: 0.95,
      ),
    );
  }

  update1()
  {
    setState(() {
      DataWaterPlants.switch1 = !DataWaterPlants.switch1;
      print(DataWaterPlants.switch1);
    });
  }
}
