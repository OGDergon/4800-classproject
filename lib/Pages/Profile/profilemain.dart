import 'package:cs4800_classproject/Database/database.dart';
import 'package:cs4800_classproject/Pages/Dashboard/dashboardmain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          children: [
            //top navigation: back to dashboard(?), profile header, settings cog
            Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardMain(user: loggedInUser,)));
                      }, icon: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                      child: const Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(onPressed: (){

                      }, icon: const Icon(Icons.settings)),
                    ),
                  ],
                )),
            //text fields
            Expanded(
              flex: 60,
              child: ListView(
                children: [
                  SizedBox(height: 20),

                  // Personal info
                  Padding(padding: sidePadding,
                    child: Text("Personal information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Edit Name'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Edit Username'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Gender',
                            hintText: 'Edit Gender'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Shipping Address',
                            hintText: 'Edit Shipping Address'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Edit Email'
                        ),
                      )
                  ),
                  const Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Edit Password'),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Billing info
                  Padding(padding: sidePadding,
                    child: Text("Billing",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Number',
                            hintText: 'Enter credit card number'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expiration Date',
                            hintText: 'Enter credit card expiration date'
                        ),
                      )
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CSC',
                            hintText: 'Enter credit card security code'
                        ),
                      )
                  ),
                  SizedBox(height: 20),

                  // Wallet info
                  Padding(padding: sidePadding,
                    child: Text("Crypto Wallet information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
                    child: TextField(

                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Wallet Address',
                          hintText: 'Edit Wallet Address'),
                    ),
                  ),
                 ],
              ),
            ),
            //save changes button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle (color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            //bottom navigation: home, create listing, profile
            Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardMain(user: loggedInUser,)));
                      }, icon: const Icon(Icons.home)),
                    ),
                    Expanded(
                      child: IconButton(onPressed: (){

                      }, icon: const Icon(Icons.add_photo_alternate)),
                    ),
                    Expanded(
                      child: IconButton(onPressed: null, icon: const Icon(Icons.person)),
                    ),
                  ],
                ))
          ]
      ),
    );
  }
}