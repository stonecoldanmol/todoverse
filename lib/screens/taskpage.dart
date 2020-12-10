
import 'package:flutter/material.dart';
import 'package:todoverse/database_helper.dart';
import 'package:todoverse/models/task.dart';
import 'package:todoverse/widgets.dart';


class TaskPage extends StatefulWidget
{
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 24.0,bottom: 6.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: ()
                              {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Image(
                                    image:AssetImage('assets/images/back_arrow_icon.png'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onSubmitted: (value) async{
                                 // print('Field value: $value');


                                  if(value!="")
                                  {
                                    DatabaseHelper _dbHelper=DatabaseHelper();

                                    Task _newTask=Task(
                                      title: value,
                                    );

                                   await _dbHelper.insertTask(_newTask);
                                   
                                  // print('New task has been created');
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter task title',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF211551),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 12.0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter task description...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.0,

                            )
                          ),
                        ),
                      ),
                      TodoWidget(
                        isDone: false,
                      ),
                      TodoWidget(
                        isDone: true,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 24.0,
                    right: 24.0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskPage()),);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFE3577),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Image(
                            image: AssetImage(
                              'assets/images/delete_icon.png',
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              )
        ),
      ),
    );
  }
}
