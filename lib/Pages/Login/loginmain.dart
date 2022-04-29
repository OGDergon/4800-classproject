import 'package:cs4800_classproject/Database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Classes/user.dart';
import '../Dashboard/dashboardmain.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    String userPass = '';
    String userEmail = '';
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 60.0, bottom: 30),
          child: Center(
            child: Container(
              width:200,
              height: 150,
              child: Image.network('https://www.cnet.com/a/img/resize/d4af1ec4d485ebda50ae89b4362b273ffc72b829/2021/03/16/0d74d5fa-a419-4d0a-8961-a132735fccad/capture1.png?auto=webp&width=940')
            )
          ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
                onChanged: (String text){
                  userEmail = text;
                  },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email id as abc@gmail.com'
              ),
            )
          ),
         Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15,bottom: 0),
          child: TextField(
            onChanged: (String text){
              userPass = text;
            },
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter secure password'),
            ),
          ),
          TextButton(onPressed: (){
            print("Just learn your password idiot.");
          }, child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)
            ),
            child: TextButton(
              onPressed: () {
                User tempUser = checkPassword(userEmail, userPass);
                if(tempUser != idiotUser){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardMain(user: tempUser,)));
                }
              },
              child: const Text(
                'Login',
                style: TextStyle (color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          const Text('New User? Create Account')
        ],
      ),
    )
    );
  }
}


