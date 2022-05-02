import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Classes/user.dart';
import 'package:cs4800_classproject/Pages/Profile/profileedit.dart';

import '../../main.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key, required this.user}) : super(key: key);
  final int myVar =1;
  final User user;
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late bool _toggled;

  @override
  void initState() {
    _toggled = MyApp.themeNotifier.value ==
        ThemeMode.light ? false : true;
    return super.initState();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  void _onSwitchChanged(bool value){
    _toggled = value;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    double padding = 16;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: _openEndDrawer,
              icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            //top navigation: back to dashboard(?), profile header, settings cog
            //text fields
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
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.person, size: 30),
                    ),
                    TextSpan(
                      text:"\tName",
                      style: TextStyle(fontSize: 30.0,color: _toggled? Colors.white: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.user.name,
                      style: TextStyle(fontSize: 25.0,color: _toggled? Colors.amber: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.male_outlined, size: 30),
                    ),
                    TextSpan(
                      text:"\tGender",
                      style: TextStyle(fontSize: 30.0,color: _toggled? Colors.white: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.user.gender,
                      style: TextStyle(fontSize: 25.0,color: _toggled? Colors.amber: Colors.blue,),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.location_city, size: 30),
                    ),
                    TextSpan(
                      text:"\tAddress",
                      style: TextStyle(fontSize: 30.0,color: _toggled? Colors.white: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.user.address,
                      style: TextStyle(fontSize: 25.0,color: _toggled? Colors.amber: Colors.blue,),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.email, size: 30),
                    ),
                    TextSpan(
                      text:"\tEmail",
                      style: TextStyle(fontSize: 30.0,color: _toggled? Colors.white: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.user.email,
                      style: TextStyle(fontSize: 25.0,color: _toggled? Colors.amber: Colors.blue,),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],

        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: (){
                _closeEndDrawer();
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileEditMain(user: widget.user,)));
              },
              title: Text('Edit Profile'),
              leading: Icon(Icons.edit),
              iconColor: Colors.blue,
            ),
            ListTile(
              onTap: (){
                _closeEndDrawer();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              iconColor: Colors.red,
            ),
            SwitchListTile(
              title: const Text("Dark Mode"),
              secondary: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onChanged: (bool value) {
                MyApp.themeNotifier.value =
                MyApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
                setState(() {
                  _onSwitchChanged(value);
                });
              },
              value: _toggled,
            ),

            TextButton(onPressed: (){
              _closeEndDrawer();
            }, child: Text('Cancel')),
          ],
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
    );
  }
}
