import 'package:flutter/material.dart';
import 'package:login_app/dummy_data/dummy_user.dart';
import 'package:login_app/modal/user.dart';

class Allusers extends StatelessWidget {
  const Allusers({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> users = dummyUsers.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Users",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 103, 34),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 3, 58, 102),
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 184, 186, 187),// Shadow color with transparency
                          spreadRadius: 2
                          , // Spread of the shadow
                          blurRadius: 3, // Blur effect
                          offset: Offset(1, 2), // Offset for the shadow
                        ),
                      ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${users[index].firstName} ${users[index].lastName}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                     Text(
                      users[index].designation,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.home_work, size: 18, color: Colors.white,),
                            const SizedBox(width: 5,),
                            Text(users[index].branch1,  style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),)
                          ],
                        ),
                        const SizedBox(width: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.directions_car_filled_rounded, size: 18, color: Colors.white,),
                            const SizedBox(width: 5,),
                            Text(users[index].vehicleNumber,  style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              users[index].email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              users[index].mobileNumber,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
