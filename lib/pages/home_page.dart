import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm:ss a').format(now);
    setState(() {
      _currentTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "W E A T H E R  A P P",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  // Search Bar
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search city...',
                      filled: true,
                      fillColor: Colors.white70,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Weather content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Icon(Icons.cloud, size: 100, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            "72°C",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "New York",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _currentTime,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Feels Like 71°C",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 30),

                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 9,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 70,
                                  margin: EdgeInsets.symmetric(horizontal: 6),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[300],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.cloud,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "71°C",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 9),
                                child: Text(
                                  "Mostly Sunny",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(4),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: Colors.grey),
                              color: Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Column(
                                children: [
                                  buildEvenRow("Tuesday", "76/62"),
                                  Divider(thickness: 2, color: Colors.grey),
                                  buildEvenRow("Wednesday", "76/62"),
                                  Divider(thickness: 2, color: Colors.grey),
                                  buildEvenRow("Thursday", "72/62"),
                                  Divider(thickness: 2, color: Colors.grey),
                                  buildEvenRow("Friday", "76/62"),
                                  Divider(thickness: 2, color: Colors.grey),
                                  buildEvenRow("Saturday", "76/62"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEvenRow(String day, String temp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            day,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 30,
          alignment: Alignment.center,
          child: Icon(Icons.cloud, color: Colors.white),
        ),
        Container(
          width: 60,
          alignment: Alignment.centerRight,
          child: Text(
            temp,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "W E A T H E R  APP",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/background.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Main Content
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 10),

//                   // Search Bar
//                   TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search city...',
//                       filled: true,
//                       fillColor: Colors.white70,
//                       prefixIcon: const Icon(Icons.search),
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 0,
//                         horizontal: 20,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   // Weather content
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Icon(Icons.cloud, size: 100, color: Colors.white),
//                           SizedBox(height: 10),
//                           Text(
//                             "72°C",
//                             style: TextStyle(
//                               fontSize: 50,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             "New York",
//                             style: TextStyle(
//                               fontSize: 40,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             " ${getCurrentTime()}",
//                             style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             "Feels Like 71°C",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),

//                           const SizedBox(height: 30),

//                           SizedBox(
//                             height: 100,
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: 9,
//                               padding: EdgeInsets.symmetric(horizontal: 8),
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   width: 70,
//                                   margin: EdgeInsets.symmetric(horizontal: 6),
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: 8,
//                                     horizontal: 4,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: Colors.grey,
//                                       width: 1,
//                                     ),
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: Colors.grey[300],
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Icon(
//                                         Icons.cloud,
//                                         size: 40,
//                                         color: Colors.white,
//                                       ),
//                                       Text(
//                                         "71°C",
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),

//                           SizedBox(height: 20),

//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Divider(
//                                   color: Colors.white,
//                                   thickness: 1,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 9),
//                                 child: Text(
//                                   "Mostly Sunny",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Divider(
//                                   color: Colors.white,
//                                   thickness: 1,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           SizedBox(height: 20),
//                           Container(
//                             padding: EdgeInsets.all(4),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(width: 2, color: Colors.grey),
//                               color: Colors.transparent,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 6),
//                               child: Column(
//                                 children: [
//                                   buildEvenRow("Tuesday", "76/62"),
//                                   Divider(thickness: 2, color: Colors.grey),
//                                   buildEvenRow("Wednesday", "76/62"),
//                                   Divider(thickness: 2, color: Colors.grey),
//                                   buildEvenRow("Thursday", "72/62"),
//                                   Divider(thickness: 2, color: Colors.grey),
//                                   buildEvenRow("Friday", "76/62"),
//                                   Divider(thickness: 2, color: Colors.grey),
//                                   buildEvenRow("Saturday", "76/62"),
//                                 ],
//                               ),
//                             ),
//                           ),

//                           SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // 💎 Clean balanced row
//   Widget buildEvenRow(String day, String temp) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           width: 100,
//           child: Text(
//             day,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Container(
//           width: 30,
//           alignment: Alignment.center,
//           child: Icon(Icons.cloud, color: Colors.white),
//         ),
//         Container(
//           width: 60,
//           alignment: Alignment.centerRight,
//           child: Text(
//             temp,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
