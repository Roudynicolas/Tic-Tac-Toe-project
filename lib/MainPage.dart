import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/HomePage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CupertinoColors.activeGreen,
      appBar: AppBar(backgroundColor: Colors.red,
      title:Center(child: Text("Tic Tac Toe",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
      ),
      body:

      Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image(image: NetworkImage("https://images.unsplash.com/photo-1608111283021-bc3345c5ce51?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dGljJTIwdGFjJTIwdG9lfGVufDB8fDB8fHww")),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()),);
              },
                child: Text("Play Game!",style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold) ,),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),),
            ),
            SizedBox(height: 100,),
            Text("@Please make sure to give me a grade no less than 90", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}