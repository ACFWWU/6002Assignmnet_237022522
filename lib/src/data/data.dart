import 'package:flutter/material.dart';

class DataList extends StatefulWidget{
  @override
  _dataListState createState() => _dataListState();
}

class _dataListState extends State<DataList>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //show the tittle in  middle of appbar
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: Text('Data List'),
      ),
    );
  }
}