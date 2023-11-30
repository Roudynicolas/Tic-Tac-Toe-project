import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool Xfirst= true;
  List<String> displayXO=["","","","","","","","","",];
  int xScore=0;
  int oScore=0;
  int filledboxes=0;
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
      backgroundColor: Colors.green[900],
      body:
          Column(
            children: [
              Expanded(child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 40.0, right: 20.0),
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0,right: 60.0, left: 20.0,top: 10.0),
                      child: Column(
                        children: [
                          Text("playerX",style: TextStyle(fontSize: 30, color: Colors.red),),
                          Text(xScore.toString(),style: TextStyle(fontSize: 30, color: Colors.red),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: IconButton(onPressed: (){
                        _clearBoard();
                        xScore=0;
                        oScore=0;
                      }, icon: Icon(Icons.restart_alt,color: Colors.white,)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0,left: 60.0,top: 10.0),
                      child: Column(
                        children: [
                          Text("playerO",style: TextStyle(fontSize: 30, color: Colors.red),),
                          Text(oScore.toString(),style: TextStyle(fontSize: 30, color: Colors.red),)
                        ],
                      ),
                    ),
                  ],
                ),
              )
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                    gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1.3,crossAxisCount: 3),
                    itemBuilder: (context, index){

                    return GestureDetector(
                      onTap: (){
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54)
                        ),
                        child: Center(
                          child: Text(displayXO[index], style: TextStyle(color: Colors.white, fontSize: 70),),
                        ),
                      ),
                    );
                    }
                ),
              ),
              Expanded(child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Text("Created by: Roudy Nicolas",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                    SizedBox(height: 49,),
                    Text("Project 1",style: TextStyle(fontSize: 14,fontStyle: FontStyle.italic),)
                  ],
                ),
              )
              ),
            ],
          ),
      );
  }
  void _tapped(int index){
    setState(() {
      if(Xfirst && displayXO[index]==""){
        displayXO[index]="x";
        Xfirst =!Xfirst;
        filledboxes++;
      }
      else if(!Xfirst && displayXO[index]==""){
        displayXO[index]="o";
        Xfirst =!Xfirst;
        filledboxes++;
      }
      _Winner();
    });
  }
  void _Winner(){
    if(displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0]!="")
      _ShowWinner(displayXO[0]);
    else if(displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3]!="")
      _ShowWinner(displayXO[3]);
    else if(displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6]!="")
      _ShowWinner(displayXO[6]);
    else if(displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0]!="")
      _ShowWinner(displayXO[0]);
    else if(displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1]!="")
      _ShowWinner(displayXO[1]);
    else if(displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2]!="")
      _ShowWinner(displayXO[2]);
    else if(displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0]!="")
      _ShowWinner(displayXO[0]);
    else if(displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2]!="")
      _ShowWinner(displayXO[2]);
    else
        if(filledboxes==9)
          _showDraw();
  }
  void _ShowWinner(String winner){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){

        return AlertDialog(

          title: Text("WINNER is: Player "+ winner.toUpperCase()),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
              _clearBoard();
            },
                child: Text("Play Again!"))
          ],
        );
      }
    );
    if(winner=="x"){
      xScore+=1;
    }else if(winner=="o"){
      oScore+=1;
    }
    }
  void _clearBoard(){
    setState(() {
      for(int i=0;i<9;i++) {
        displayXO[i] = "";
      }
      filledboxes=0;
    });

  }
  void _showDraw(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("It's a draw!"),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
            _clearBoard();
          }, child: Text("Play Again!"))
        ],
      );
    }
    );
  }
  }
