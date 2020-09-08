// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

//Ref Page
import 'package:flutterframeassit/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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
                            Text(DB.getData('Home','Label','Title'), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.black),),
                          ],
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                  ),
                SizedBox(height: 24),
                Container(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[                          
                                        new LinearPercentIndicator(
                                        padding: EdgeInsets.all(5),
                                        width: Media.itemWidth,
                                        lineHeight: 30.0,
                                        percent: double.parse(DB.getData('Home','Data','Tank1')),
                                        progressColor: Colors.green,
                                        center: Text(DB.getData('Home','Label','Tank1')),
                                        animation: true,
                                      ),],
                  )
                ),
                SizedBox(height: 24),
                Container(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[                          
                                        new LinearPercentIndicator(
                                        padding: EdgeInsets.all(5),
                                        width: Media.itemWidth,
                                        lineHeight: 30.0,
                                        percent: double.parse(DB.getData('Home','Data','Tank2')),
                                        progressColor: Colors.green,
                                        center: Text(DB.getData('Home','Label','Tank2')),
                                        animation: true,
                                      ),],
                  )
                ),
                SizedBox(height: 24)
                ,Container(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[                          
                                        new LinearPercentIndicator(
                                        padding: EdgeInsets.all(5),
                                        width: Media.itemWidth,
                                        lineHeight: 30.0,
                                        percent: double.parse(DB.getData('Home','Data','Tank3')),
                                        progressColor: Colors.green,
                                        center: Text(DB.getData('Home','Label','Tank3')),
                                        animation: true,
                                      ),],
                  )
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
    
              
      // return Container(
      // height: MediaQuery.of(context).size.height,
      // width: double.infinity,
      // child: DraggableScrollableSheet(
        
      //     builder: (context, scrollController){
      //     return Container(

      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: <Widget>[
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: <Widget>[
                          // new LinearPercentIndicator(
                          //                             padding: EdgeInsets.all(50),
                          //                             width: 300.0,
                          //                             lineHeight: 30.0,
                          //                             percent: 0.4,
                          //                             progressColor: Colors.orange,
                          //                             center: Text("Water in tank"),
                          //                           ),
      //                     ],
      //                   ),
      //                 ]
      //               )

      //     );
      //     }

      // )
      // );
  }
}
