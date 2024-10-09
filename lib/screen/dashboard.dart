import 'package:flutter/material.dart';
import 'package:login_app/modal/user.dart';
import 'package:login_app/screen/allusers.dart';
import 'package:login_app/screen/attendance.dart';
import 'package:login_app/screen/journey.dart';
import 'package:login_app/screen/login.dart';
import 'package:login_app/widget/cardItem.dart';
import 'package:login_app/widget/menuItem.dart';
// import 'package:login_app/widget/userInfo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {

    void startJourney() {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Journey(title: "Journey")));
    }

    void logout() {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                actionsPadding: const EdgeInsets.only(bottom: 10, right: 20),
                actionsAlignment: MainAxisAlignment.end,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                title: const Text("Confirm Logout"),
                content: const Text("Are you sure want to log out?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("No",
                          style: TextStyle(color: Colors.black))),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Successfully Logged Out!")));
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const LoginScreen(),
                        ));
                      },
                      child: const Text(
                        "Yes",
                        style:
                            TextStyle(color: Color.fromARGB(255, 241, 34, 20)),
                      )),
                ],
              ));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "DashBoard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 103, 34),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: logout, icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 172, 63, 0),
                    Color.fromARGB(255, 242, 103, 34),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGF USER MENU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MenuItem(
                title: "Home",
                logo: Icons.home,
                onTapped: () {
                  Navigator.pop(context);
                }),
            MenuItem(
                title: "All Users",
                logo: Icons.supervised_user_circle,
                onTapped: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (cxt) => const Allusers()));
                }),
            MenuItem(
                title: "Attendance",
                logo: Icons.analytics_outlined,
                onTapped: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const AttendanceScreen()));
                }),
            MenuItem(
              title: "Logout",
              logo: Icons.exit_to_app,
              onTapped: logout,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Stack(children: [
 if (user.imageUrl == 'null')
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromARGB(255, 145, 145, 145),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(25),
                          child: Image.asset('assets/user.jpg'))
                    else
                      CircleAvatar(
                          backgroundImage: NetworkImage(user.imageUrl),
                          radius: 50),
                    if (user.activated == 'true')
                     const  Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 25,
                        ),
                      )
                    else
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.cancel_rounded,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                   ],),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${user.firstName} ${user.lastName}',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("Start Daily Report Below",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: startJourney,
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 242, 103, 34)),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                      ),
                      child: const Text("Start the Journey"),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      onPressed: startJourney,
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 242, 103, 34)),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                      ),
                      child: const Text("End the Journey"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardItem(
                          title: "Day In",
                          imageUrl: "assets/dashboard_icons/day_in.png"),
                      CardItem(
                          title: "Daily Records",
                          imageUrl: "assets/dashboard_icons/notes.png"),
                      CardItem(
                          title: "Invoice",
                          imageUrl: "assets/dashboard_icons/invoice.png"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardItem(
                          title: "Day End",
                          imageUrl: "assets/dashboard_icons/day_out.png"),
                      CardItem(
                          title: "Feed Transfer",
                          imageUrl: "assets/dashboard_icons/feed.png"),
                      CardItem(
                          title: "Report",
                          imageUrl: "assets/dashboard_icons/monitor.png"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardItem(
                          title: "Flock Book",
                          imageUrl: "assets/dashboard_icons/book.png"),
                      CardItem(
                          title: "Daily Plan",
                          imageUrl: "assets/dashboard_icons/daily_plan.png"),
                      CardItem(
                          title: "Feed Entry",
                          imageUrl: "assets/dashboard_icons/feed_entry.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     padding: const EdgeInsets.only(top: 40),
          //     decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //           colors: [
          //             Colors.blue,
          //             Color.fromARGB(255, 2, 48, 87),
          //           ],
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //         ),
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(65),
          //             topRight: Radius.circular(65))),
          //     height: double.infinity,
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           UserInfo(
          //               title: "Name",
          //               value: '${user.firstName} ${user.lastName}',
          //               logo: Icons.person),
          //           UserInfo(
          //               title: "Designation",
          //               value: user.designation,
          //               logo: Icons.work),
          //           UserInfo(
          //               title: "Reporting To",
          //               value: user.reportingTo,
          //               logo: Icons.supervised_user_circle_rounded),
          //           UserInfo(
          //               title: "Vehicle No.",
          //               value: user.vehicleNumber,
          //               logo: Icons.directions_car_filled_rounded),
          //           UserInfo(
          //             title: "Entry Days",
          //             value: user.entryDays,
          //             logo: Icons.calendar_month_rounded,
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.only(top: 12, bottom: 12),
          //             child: Text(
          //               "Contact Info: ",
          //               style: TextStyle(
          //                   fontSize: 26,
          //                   fontWeight: FontWeight.w600,
          //                   color: Colors.white),
          //             ),
          //           ),
          //           UserInfo(
          //             title: "Email",
          //             value: user.email,
          //             logo: Icons.email,
          //           ),
          //           UserInfo(
          //             title: "Mobile",
          //             value: user.mobileNumber,
          //             logo: Icons.phone,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
