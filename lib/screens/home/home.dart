
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_key/screens/home/sidebar/sidebarlayout.dart';
import 'package:green_key/screens/authenticate/login.dart';
import 'package:green_key/services/auth.dart';

void main() {
  runApp(
      MaterialApp(
        home: Home(),
      )
  );
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
     body: Container(
       child: Homelayout(),
     ),
     endDrawer:SidebarLayout(),
    );
  }
}

class Homelayout extends StatefulWidget   {

  @override
  _HomelayoutState createState() => _HomelayoutState();
}

class _HomelayoutState  extends State<Homelayout> {

  final AuthService _auth = AuthService();
  GlobalKey<ScaffoldState> _stackKey = GlobalKey<ScaffoldState>();
  int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _stackKey,
      body: Stack(
          children:<Widget>[
            Positioned(
              width: 70,
              top: 0,
              bottom: 0,
              right:  -40,
              child: ClipPath(
                clipper: SidebarClipper(180,290),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors:[
                          Colors.lightGreenAccent,
                          Colors.lightGreenAccent,
                          Colors.lightGreenAccent
                        ],
                        stops: [
                          0.0,1.0,1.0
                        ],
                      )
                  ),
                ),
              ),
            ),
            Positioned(
              right: -10,
                top: 211,
                child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.grey[500]),onPressed: (){},),
                   //Text('<<',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.grey[500]),),
            ),
            Positioned(
              left: 3,
              child: Column(
                children: [
                SizedBox(height: 22,),
              IconButton(
                icon:Icon(Icons.menu,
                size: 30,
                color: Colors.grey[800],
              ),
                  onPressed: () {_stackKey.currentState.openDrawer();}
              ),

              ],
            ),
            ),
            Positioned(
              left: 50,
              top: 40,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Green",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.lightGreenAccent,),),
                ],
              ),
            ),
            Positioned(
              left: 158,
              top: 40,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Key",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                ],
              ),
            ),
            Positioned(
              top: 100,
              left: 46,
              child: AnimatedSearchBar(),
            ),
          ],


      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, 
          children: <Widget>[
            Container(
              color: Colors.grey[800],
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 16),
                      child: Icon(Icons.account_circle,size: 90,color: Colors.lightGreenAccent,),
                    ),
                    Text('Nikhil Gowda',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.lightGreenAccent,
                      ),),
                    Text('nikhianad@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    SizedBox(height: 18,),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.account_box,color: Colors.lightGreenAccent,),
                            title: Text('My Account',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(Icons.build,color: Colors.lightGreenAccent,),
                            title: Text('Settings',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(Icons.lock_outline,color: Colors.lightGreenAccent,),
                            title: Text('Logout',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: () async {
                              await _auth.signOut();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.favorite,color: Colors.lightGreenAccent,),
                            title: Text('Fav Lists',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(Icons.local_offer,color: Colors.lightGreenAccent,),
                            title: Text('Offer/Reward Area',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(Icons.business_center, color: Colors.lightGreenAccent,),
                            title: Text('Sell on GreenKey',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal:2.0),
                            child:Container(
                              height:2.0,
                              width:290.0,
                              color:Colors.grey,),),
                          ListTile(
                            title: Text('Privacy Policies',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                          ListTile(
                            title: Text('Help Center',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[800],
                            ),),
                            onTap: (){},
                          ),
                         ListTile(
                           title: Text('Green Plus Zone',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[800],
                           ),),
                           onTap: (){},
                         ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.grey[900],
        iconSize: 24.0,
       currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 19,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 12,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.lightGreenAccent,),
            title: Text('Home',style: TextStyle(color: Colors.white,),),
            backgroundColor: Colors.grey[900],
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail,color: Colors.lightGreenAccent,),
            title: Text('Mssg',style: TextStyle(color: Colors.white,),),
            backgroundColor: Colors.grey[900],
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mobile_screen_share,color: Colors.lightGreenAccent,),
            title: Text('GreenPay',style: TextStyle(color: Colors.white,),),
            backgroundColor: Colors.grey[900],
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone,color: Colors.lightGreenAccent,),
            title: Text('Contact',style: TextStyle(color: Colors.white,),),
            backgroundColor: Colors.grey[900],
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.lightGreenAccent,),
              title: Text('Cart',style: TextStyle(color: Colors.white,),),
            backgroundColor: Colors.grey[900],
          ),
        ],
        onTap: (index){setState(() {
          _currentIndex=index;
        });},
      ),
    );
  }
}


class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 280 : 320,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                decoration: InputDecoration(
                    hintText: 'Key Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none),
              )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_folded ? 32 : 0),
                  topLeft: Radius.circular(32),
                  bottomRight: Radius.circular(_folded ? 32 : 0),
                  bottomLeft: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2,right: 8),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.grey[900],
                    size: 28,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

