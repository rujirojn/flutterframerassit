import 'package:flutter/material.dart';
import 'package:flutterframeassit/Model.dart';
// import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class WaterPlantsScreen extends StatefulWidget {
  const WaterPlantsScreen({ Key key }) : super(key: key);

  @override
  _WaterPlantsScreen createState() => _WaterPlantsScreen();
}

class _WaterPlantsScreen extends State<WaterPlantsScreen> {
  // Duration _duration = Duration(hours: 0, minutes: 0);
  // double _upperValue = 30;
  
  Widget build(BuildContext context) {
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
                            Text("ระบบน้ำ", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.black),),
                            // Text("2 Physical Card, and 1 Virtual Card", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.all(Radius.circular(10)),
                  //       boxShadow: [BoxShadow(
                  //           color: Colors.grey[100],
                  //           spreadRadius: 10.0,
                  //           blurRadius: 4.5
                  //       )]
                  //   ),
                  //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  //   margin: EdgeInsets.symmetric(horizontal: 32),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Row(
                  //         children: <Widget>[
                  //           Icon(
                  //             Icons.mobile_screen_share,
                  //             color: Colors.lightBlue[900],
                  //           ),
                  //           SizedBox(
                  //             width: 16,
                  //           ),

                  //           Text("ATM Withdraws", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey[700]),)

                  //         ],
                  //       ),
                  //       Switch(
                  //         value: DataWaterPlants.switch1,
                  //         activeColor: Color.fromRGBO(50, 172, 121, 1),
                  //         onChanged: (_){update1();},
                  //       ),
                  //       // CupertinoSwitch(
                  //       //   value: true,
                  //       //   onChanged: (_) {},
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          hideAlldisplayDurationfarm1();
                          DataWaterPlants.displayDurationfarm1 = !DataWaterPlants.displayDurationfarm1;
                        });
                      },
                      child: buildcontainer(' Farm1',' กำลังรดน้ำ','นับถอยหลัง ' + ((DataWaterPlants.remainDurationfarm1).round()).toString() + ' นาที','จากทั้งหมด 15 นาที'),
                  ), 
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      padding: EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child:  Visibility (
                                                  visible: DataWaterPlants.displayDurationfarm1,
                                                  child: buildFlutterSlider()
                                              ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                            ],
                          ),
                        ],
                      ),
                    ),
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


  Container buildcontainer(labelTopL,labelTopR,labelBotL,labelBotR){
   return Container(
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                               ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.all(Radius.circular(18))
                            ),
                            child: Icon(Icons.whatshot, color: Colors.lightBlue[900],),
                            padding: EdgeInsets.all(12),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(labelTopL, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[900]),),
                                Text(labelTopR, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(labelBotL, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.lightGreen),),
                              Text(labelBotR, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                            ],
                          ),
                        ],
                      ),
                    );
  }


  hideAlldisplayDurationfarm1()
  {
    setState(() {
        // DataWaterPlants.displayDurationfarm1 = false;
        // DataWaterPlants.displayDurationfarm2 = false; 
        // DataWaterPlants.displayDurationfarm3 = false;
        // DataWaterPlants.displayDurationfarm4 = false;
        // DataWaterPlants.displayDurationfarm5 = false;
        // DataWaterPlants.displayDurationfarm6 = false;
    });   
  }
  
  buildFlutterSlider (){
   return FlutterSlider(
                      values: [DataWaterPlants.remainDurationfarm1],
                      max: 30,
                      min: 0,
                      rtl: false,
                      trackBar: FlutterSliderTrackBar(
                        activeTrackBarHeight: 10,
                        inactiveTrackBar: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(0.3),
                        ),
                         activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.green,
                          ),
                      ),
                    handler: customHandler(Icons.watch_later),
                     tooltip: FlutterSliderTooltip(
                          textStyle: TextStyle(fontSize: 32, color: Colors.white),
                          boxStyle: FlutterSliderTooltipBox(
                                      decoration: BoxDecoration(color: Colors.green),
                          )
                      ),
                      hatchMark: FlutterSliderHatchMark(
                        density: 0.5, // means 50 lines, from 0 to 100 percent
                        labels: [
                          FlutterSliderHatchMarkLabel(percent: 10, label: Text('เหลือ')),
                          FlutterSliderHatchMarkLabel(percent: 90, label: Text('เวลา')),
                        ],
                      ),
                      handlerAnimation: FlutterSliderHandlerAnimation(
                          curve: Curves.elasticOut,
                          reverseCurve: null,
                          duration: Duration(milliseconds: 700),
                          scale: 2),
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        setState(() {
                          DataWaterPlants.remainDurationfarm1 = lowerValue;
                        });
                      },
                    );
  }

  customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 23,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.green.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1))
          ],
        ),
      ),
    );
  }
  // update1()
  // {
  //   setState(() {
  //     DataWaterPlants.displayDurationfarm1 = !DataWaterPlants.displayDurationfarm1;
  //     print(DataWaterPlants.displayDurationfarm1);
  //   });
  // }
}
