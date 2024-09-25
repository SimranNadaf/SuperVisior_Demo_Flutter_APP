import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/modal/user.dart';
import 'package:login_app/screen/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  var version = '';
  bool isLoading = false;

  void getVersion() async {
    var url = 'http://10.104.2.83:8083/api/api-version/getactive';
    var response = await http.get(Uri.parse(url));
    print('version: ${response.body}');
    setState(() {
      version = jsonDecode(response.body)['data']['version'];
    });
  }

  @override
  void initState() {
    super.initState();
    getVersion();
  }

  @override
  void dispose() {
    user.dispose();
    pwd.dispose();
    super.dispose();
  }

  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {

    void login() async {
      
      if (user.text.isEmpty || pwd.text.isEmpty) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please Enter Required Data!")));
        return;
      }

      try {
        var url =
            'http://10.104.2.83:8083/api/users/bylogin?login=${user.text}&name=${pwd.text}';
        setState(() {
        isLoading = true;
      });
        var response = await http.get(Uri.parse(url), headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjZ2ZhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfTElORV9TVVBFUlZJU09SLFJPTEVfVVNFUiIsImV4cCI6MTczNTcyMTI5OX0.CyauvbUdnDoXAqdY0shlnhZS4hh91ZwfvK0c3ilYQZES5CMj4Pd-6LV0warlbI9mu1P8d0k0EhVhkmQ1frLSGA'
        });
        print(response.statusCode);
        List<dynamic> res = [];
        if (response.statusCode == 200) {
          res = json.decode(response.body);
          print('User: $res');
        }
        if (res.isEmpty) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Wrong Credentionals!")));
          setState(() {
            isLoading = false;
          });
          return;
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Successfully Logged In!")));
          final Data = res[0];
          User userData = User(
              id: Data['id'].toString(),
              login: Data['login'].toString(),
              firstName: Data['firstName'].toString(),
              lastName: Data['lastName'].toString(),
              email: Data['email'].toString(),
              activated: Data['activated'].toString(),
              langKey: Data['langKey'].toString(),
              imageUrl: Data['imageUrl'].toString(),
              resetDate: Data['resetDate'].toString(),
              mobileNumber: Data['mobileNumber'].toString(),
              imeiNumber1: Data['imeiNumber1'].toString(),
              imeiNumber2: Data['imeiNumber2'].toString(),
              branch1: Data['branch1'].toString(),
              branch2: Data['branch2'].toString(),
              designation: Data['designation'].toString(),
              reportingTo: Data['reportingTo'].toString(),
              fcmToken: Data['fcmToken'].toString(),
              vehicleNumber: Data['vehicleNumber'].toString(),
              entryDays: Data['entryDays'].toString());
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => Dashboard(user: userData),
          ));
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        print('Exception : $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "CGF Application",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 242, 103, 34)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          child: Column(
            children: [
              Image.asset('assets/japfa.png', scale: 2),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Version: $version',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Japfa Contract Farming",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: user,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(
                            122, 0, 0, 0)), // Set border color here
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  label: Text("Username"),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                textCapitalization: TextCapitalization.none,
                enableSuggestions: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pwd,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(
                            122, 0, 0, 0)), // Set border color here
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                obscureText: true,
                enableSuggestions: false,
              ),
              const SizedBox(height: 45),
              if (isLoading)
                const Column(
                  children: [
                    CircularProgressIndicator(color: Color.fromARGB(255, 0, 0, 0),),
                    SizedBox(height: 10,),
                    Text("Authenticating...")
                  ],
                )
              else
                TextButton(
                  onPressed: login,
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    ),
                    foregroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 242, 103, 34),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
