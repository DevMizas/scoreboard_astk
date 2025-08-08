import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 1200;
    final double height = MediaQuery.of(context).size.height / 600;
    return Material(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      //=======  Points
                      Container(
                        height: 450 * height,
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height / 1.5,
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontSize: 370 * width,
                                fontWeight: FontWeight.w600,

                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //=======  Buttons add and remove points
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40 * width,
                              height: 35 * height,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.black54),
                              ),
                              child: Icon(Icons.remove, color: Colors.black45),
                            ),
                            SizedBox(width: 20 * width),
                            Container(
                              width: 40 * width,
                              height: 35 * height,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.black54),
                              ),
                              child: Icon(Icons.add, color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                      //=======  infractions
                      Row(
                        children: [
                          Text(
                            "C1",
                            style: TextStyle(
                              fontSize: 50 * width,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 50 * width),
                          Container(
                            width: 400 * width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "C",
                                  style: TextStyle(
                                    fontSize: 50 * width,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "K",
                                  style: TextStyle(
                                    fontSize: 50 * width,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "HC",
                                  style: TextStyle(
                                    fontSize: 50 * width,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.yellow,
                                  ),
                                ),
                                Text(
                                  "H",
                                  style: TextStyle(
                                    fontSize: 50 * width,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "C2",
                            style: TextStyle(
                              fontSize: 50 * width,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container(color: Colors.red)),
            ],
          ),
          //=======  Timer
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 260 * width,
              height: 120 * height,
              margin: EdgeInsets.only(top: 150 * height),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "2:30",
                style: TextStyle(
                  fontSize: 100 * width,
                  fontWeight: FontWeight.w600,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
