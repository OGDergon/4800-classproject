import 'package:cs4800_classproject/Database/database.dart';
import 'package:flutter/material.dart';

import '../../Classes/user.dart';
import '../Dashboard/dashboardmain.dart';
import '../Profile/profileedit.dart';
import '../Profile/profilemain.dart';
import 'loginmain.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  String buttonText = 'Create Account';
  Color buttonColor = Colors.blue;

  String userName1 = 'different';
  String userName2 = 'placeholder';

  String password1 = 'data';
  String password2 = 'lmao';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10.0, bottom: 0),
                child: Center(
                    child: Container(
                      child: Text('Create Your Account',
                        style: TextStyle(
                          fontSize: 25
                        ),
                      ),
                      padding: EdgeInsets.all(60.0),
                    )
                ),),
              Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                  child: TextField(
                    onChanged: (String text) {
                        userName1 = text;
                        // print(userName1);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    onChanged: (String text) {
                      userName2 = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Email',
                        hintText: 'Re-enter valid email id as abc@gmail.com'
                    ),
                  )
              ),
              Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15,bottom: 0),
                child: TextField(
                  onChanged: (String text) {
                    password1 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 15,bottom: 10),
                child: TextField(
                  onChanged: (String text) {
                    password2 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Your Password'),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: buttonColor, borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed: () {
                    if ((userName1 == userName2) && (password1 == password2)) {
                      // print('accepted');
                      setState(() {
                        //create user.
                        final userid = generateUserID();
                        User newUser = User(generateUserID(),'Name','gender','address',password1,'walletaddress',userName1);
                        addUser(newUser);
                        buttonColor = Colors.blue;
                        buttonText = 'Create Account';

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginMain()),);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardMain(user: newUser,)));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMain(user: newUser,)),);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileEditMain(user: newUser,)));


                      });



                    }
                    else if ((userName1 != userName2) && (password1 == password2)) {
                      setState(() {
                        buttonText = 'Email Mismatch';
                        buttonColor = Colors.red;
                      });
                      // print('first else');
                    }
                    else {
                      setState(() {
                        buttonText = 'Password Mismatch';
                        buttonColor = Colors.red;
                      });
                      // print('last else');
                    }
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
            ],
          ),
        )
    );
  }
}


