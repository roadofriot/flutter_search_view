import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _searchEdit =  TextEditingController();

  bool _isSearch = true;
  String _searchText = "";

  List<String> _socialListItems;
  List<String> _searchListItems;

  @override
  void initState() {
    super.initState();
    _socialListItems =  List<String>();
    _socialListItems = [
      "Facebook",
      "Instagram",
      "Twitter",
      "LinkedIn",
      "Messenger",
      "WhatsApp",
      "Naukri",
      "Medium",
      "Tinder",
      "Gmail",
      "Hangouts",
      "Google Plus",
      "Snapchat",
      "True Caller",
      "WeChat",
      "Pinterest",
      "Quora"
    ];
    _socialListItems.sort();
  }

  _HomeScreenState() {
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _isSearch = true;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text("Search List"),
      ),
      body:  Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child:  Column(
          children: <Widget>[
            _searchBox(),
            _isSearch ? _listView() : _searchListView()
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return  Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child:  TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle:  TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _listView() {
    return  Flexible(
      child:  ListView.builder(
          itemCount: _socialListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return  Card(
              color: Colors.cyan[50],
              elevation: 5.0,
              child:  Container(
                margin: EdgeInsets.all(15.0),
                child:  Text("${_socialListItems[index]}"),
              ),
            );
          }),
    );
  }

  Widget _searchListView() {
    _searchListItems =  List<String>();
    for (int i = 0; i < _socialListItems.length; i++) {
      var item = _socialListItems[i];

      if (item.toLowerCase().contains(_searchText.toLowerCase())) {
        _searchListItems.add(item);
      }
    }
    return _searchAddList();
  }

  Widget _searchAddList() {
    return  Flexible(
      child:  ListView.builder(
          itemCount: _searchListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return  Card(
              color: Colors.cyan[100],
              elevation: 5.0,
              child:  Container(
                margin: EdgeInsets.all(15.0),
                child:  Text("${_searchListItems[index]}"),
              ),
            );
          }),
    );
  }}