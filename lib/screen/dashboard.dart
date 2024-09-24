import 'package:flutter/material.dart';
import 'package:login_app/modal/user.dart';
import 'package:login_app/screen/allusers.dart';
import 'package:login_app/screen/login.dart';
import 'package:login_app/widget/menuItem.dart';
import 'package:login_app/widget/userInfo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DashBoard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 103, 34),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Successfully Logged Out!")));
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                ));
              },
              icon: const Icon(Icons.exit_to_app_rounded))
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (cxt) => Allusers()));
                }),
            MenuItem(
              title: "Logout",
              logo: Icons.exit_to_app,
              onTapped: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Successfully Logged Out!")));
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => const LoginScreen(),
                )); 
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (user.imageUrl == 'null')
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 145, 145, 145),
                        width: 3.0, 
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.1), 
                          spreadRadius: 2, 
                          blurRadius: 10, 
                          offset: const Offset(0, 5), 
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(25),
                    child: Image.asset('assets/user.jpg'))
              else
                Image.network(user.imageUrl),
              Text(
                'Hello, ${user.firstName}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Color.fromARGB(255, 2, 48, 87),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65),
                      topRight: Radius.circular(65))),
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserInfo(
                        title: "Name",
                        value: '${user.firstName} ${user.lastName}',
                        logo: Icons.person),
                    UserInfo(
                        title: "Designation",
                        value: user.designation,
                        logo: Icons.work),
                    UserInfo(
                        title: "Reporting To",
                        value: user.reportingTo,
                        logo: Icons.supervised_user_circle_rounded),
                    UserInfo(
                        title: "Vehicle No.",
                        value: user.vehicleNumber,
                        logo: Icons.directions_car_filled_rounded),
                    UserInfo(
                      title: "Entry Days",
                      value: user.entryDays,
                      logo: Icons.calendar_month_rounded,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text(
                        "Contact Info: ",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    UserInfo(
                      title: "Email",
                      value: user.email,
                      logo: Icons.email,
                    ),
                    UserInfo(
                      title: "Mobile",
                      value: user.mobileNumber,
                      logo: Icons.phone,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
