import 'package:flutter/material.dart';
import 'ActionContent.dart';

class AcceptedActionCardContent extends StatefulWidget {
  //final Index index;
  ActionContent actionContent = new ActionContent();
  AcceptedActionCardContent({@required this.actionContent});

  @override
  _AcceptedActionCardContentState createState() => new _AcceptedActionCardContentState(
      this.actionContent
  );
}

class _AcceptedActionCardContentState extends State<AcceptedActionCardContent> {

  ActionContent actionContent = new ActionContent();
  static ActionContent actionContentUse = new ActionContent();
  _AcceptedActionCardContentState(this.actionContent);
  double indicatorValue = 0.50;


  @override
  Widget build(BuildContext context) {

    String dueDate = actionContent.dueDate.split("T")[0];
    print(dueDate);
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            Icon(
              Icons.work,
              color: Colors.white,
              size: 40.0,
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              actionContent.taskId,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
        Container(
          width: 130.0,
          child: new Divider(color: Colors.yellowAccent),
        ),
        SizedBox(height: 10.0),
        Text(
          actionContent.action,
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        SizedBox(height: 30.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
               padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" Due Date ",style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              width: 100.0,
            ),
            new Container(
              padding: const EdgeInsets.all(3.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.yellowAccent)
              ),
              child: new Text(" Assigned To ",style: TextStyle(color: Colors.white)),
            ),
//            new Container(
//              padding: const EdgeInsets.all(3.0),
//              decoration: new BoxDecoration(
//                  border: new Border.all(color: Colors.yellowAccent)
//              ),
//              child: new Text("End Date",style: TextStyle(color: Colors.white)),
//            ),
          ],

        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              dueDate,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 100.0,
            ),
            Text(
              actionContent.assignedPersonName,
              style: TextStyle(color: Colors.white),
            )
          ],

        ),

      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Task.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );



    final bottomContentText = Text(
      "Description Not Available",
      style: TextStyle(fontSize: 18.0),
    );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("Record : ${actionContent.record}", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );


    return Scaffold(
      body: Column(
          children: <Widget>[topContent, bottomContent]),
    );
  }
}
