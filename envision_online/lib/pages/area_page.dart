import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'splash_page.dart';
import 'package:envision_online/utils/app_shared_preferences.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_text.dart';
import 'package:flutter/cupertino.dart';

class AreaPage extends StatefulWidget {
  final areas;
  AreaPage({Key key, @required this.areas}) : super(key: key);

  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);
  List areas;
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    areas = widget.areas;
    dropdownValue = areas[0]['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: cAppPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Area', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
      ),
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            _container(),
            progressDialog,
          ],
        ),
      ),
    );
  }

  Widget _container() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: cAppPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TopLogoBar(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          CardText(title: 'Select Area'),
          _areaList(),
          CardButton(title: 'Next', callback: () { _onNext(); }),
        ],
      ),
    );
  }

  Widget _areaList() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: DropdownButton(
        isExpanded: true,
        value: dropdownValue,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: areas.map((area) => DropdownMenuItem<String>(value: area['name'], child: Text(area['name']))).toList(),
      ),
    );
  }

  void _onNext() {

  }
}
