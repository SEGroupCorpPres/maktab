import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 55, 0, 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 55,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              SizedBox(
                height: 55,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "2",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 35,),
                                Text(
                                  "Farzandlar soni",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "56815673",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 35,),
                                Text(
                                  "Telegram id",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "67256",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 35,),
                                Text(
                                  "Ota-Onasi idsi",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
