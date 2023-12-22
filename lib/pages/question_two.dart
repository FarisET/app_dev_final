// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiScreen extends StatelessWidget {
  const UiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                      child: Text('Recommended for your devices',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Raleway')),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.blue,
                          fontSize: 12,
                          fontFamily: 'Raleway'),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: Card(
                    color: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Image(
                            image: AssetImage(
                                'lib/assets/airpods-max-select-silver-202011.png'),
                            //         fit: BoxFit.contain,
                            height: MediaQuery.sizeOf(context).height * 0.55,
                            width: MediaQuery.sizeOf(context).width * 0.55,
                          ),
                          Text('Free Engraving',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.yellow[800],
                                  fontSize: 24,
                                  fontFamily: 'Raleway')),
                          Row(
                            children: [
                              Text('AirPods Max',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Raleway',
                                  )),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.white),
                              Text('Silver',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Raleway')),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('A\$899.00',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: 'Raleway')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                minRadius: 8,
                                maxRadius: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                minRadius: 8,
                                maxRadius: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                minRadius: 8,
                                maxRadius: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                minRadius: 8,
                                maxRadius: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )

                // ClipRRect(
                //       clipBehavior: Clip.hardEdge,
                //       child: SizedBox(
                //         width: MediaQuery.of(context).size.width,
                //         child: Padding(
                //           padding: const EdgeInsets.all(12.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 decoration: BoxDecoration(
                //                   color:
                //                 ),
                //                 height: MediaQuery.of(context).size.width*0.6,
                //                 child: Text('data'),
                //               )
                //             ]
                //           )
                //         )
                //       )
                // )
              ],
            ),
          )),
    );
  }
}
