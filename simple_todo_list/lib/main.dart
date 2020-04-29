import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SimpleTodoList(),
    );
  }
}

class SimpleTodoList extends StatefulWidget {
  @override
  _SimpleTodoListState createState() => _SimpleTodoListState();
}

class _SimpleTodoListState extends State<SimpleTodoList> {
  @override
  Widget build(BuildContext context) {
    List<String> lists = [
      '오늘 해야할 일',
      '어제 했어야 하는 일',
      '언제할지 모르는 일',
      '할 마음이 있는지 모르는 일',
      '인제 기억도 안나는 일',
    ];

    return Scaffold(
      backgroundColor: Color(int.parse(
        "#FFF6D9".replaceAll('#', '0xff'),
      )),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 400,
            height: 650,
            child: Image.asset('images/winniethepooh.png', fit: BoxFit.contain),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: Text(
              '내일의 내가 하겠지',
              style: TextStyle(
                  color: Color(int.parse(
                    "#FC767D".replaceAll('#', '0xff'),
                  )),
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
          ),
          DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  color: Color(int.parse(
                    "#D94041".replaceAll('#', '0xff'),
                  )),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      child: Positioned(
                        top: -30,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                          backgroundColor: Color(int.parse(
                            "#F6C046".replaceAll('#', '0xff'),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    ListView.separated(
                      itemBuilder: (context, index) {
                        final todos = lists[index];
                        return Container(
                          child: ListTile(
                            title: Text(
                              todos,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '진짜 할꺼야?',
                              style: TextStyle(color: Colors.white70),
                            ),
                            trailing: Icon(
                              Icons.check_circle,
                              color: Color(int.parse(
                                "#F6C046".replaceAll('#', '0xff'),
                              )),
                            ),
                          ),
                        );
                      },
                      controller: scrollController,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.white70,
                        );
                      },
                      itemCount: lists.length,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MainImage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Image.asset('images/winniethepooh.png');
  }
}

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        border: Border.all(color: Colors.grey[300], width: 1),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 9,
            child: TextField(
              maxLength: 25,
              decoration: InputDecoration(
                  counterStyle: TextStyle(fontSize: 0),
                  hintText: "안할걸 알고 있지만 적어보거라",
                  border: InputBorder.none),
            ),
          ),
          Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.blueGrey,
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
