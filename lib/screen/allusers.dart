import 'package:flutter/material.dart';
import 'package:login_app/dummy_data/dummy_user.dart';
import 'package:login_app/modal/user.dart';
import 'package:url_launcher/url_launcher.dart';

class Allusers extends StatelessWidget {
  const Allusers({super.key});

  void showMailModal(context, String email) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 180,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 25,),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(221, 167, 165, 165),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 3,
                  width: 30,
                ),
                const Text(
                  'Sent Email to',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () async{
                    final Uri emailLaunchUri =
                        Uri(scheme: 'mailto', path: email);
                        await launchUrl(emailLaunchUri);
                    // Navigator.pop(context);
                  },
                  child: const Text(
                    'Sent Mail',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromARGB(255, 242, 103, 34),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showPhoneModal(context, String phone) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(221, 167, 165, 165),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  height: 3,
                  width: 30,
                ),
                const Text(
                  'Connect with',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                Text(
                  phone,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 80,
                        width: 80,
                        child: IconButton(
                            onPressed: () async{
                              final Uri url = Uri(scheme: 'tel', path: phone);
                              await launchUrl(url);
                            },
                            icon: Image.asset('assets/phone.jpg'))),
                    const SizedBox(
                      width: 35,
                    ),
                    SizedBox(
                        height: 80,
                        width: 80,
                        child: IconButton(
                            onPressed: () async{
                              var androidUrl = "whatsapp://send?phone=$phone";
                              final Uri url = Uri.parse(androidUrl);
                              await launchUrl(url);
                            },
                            icon: Image.asset('assets/whatsapp.jpg'))),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      color: Color.fromARGB(
                          255, 184, 186, 187), // Shadow color with transparency
                      spreadRadius: 2, // Spread of the shadow
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
                            const Icon(
                              Icons.home_work,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              users[index].branch1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.directions_car_filled_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              users[index].vehicleNumber,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
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
                        GestureDetector(
                          onTap: () {
                            showMailModal(context, users[index].email);
                          },
                          child: Row(
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
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () => showPhoneModal(
                              context, users[index].mobileNumber),
                          child: Row(
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
