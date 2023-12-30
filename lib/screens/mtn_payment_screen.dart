import 'package:fitnessapp/services/rest_api_service.dart';
import 'package:flutter/material.dart';

class MtnPaymentScreen extends StatefulWidget {
  static const id = 'mtn_payment_screen';
  @override
  _MtnPaymentScreenState createState() => _MtnPaymentScreenState();
}

class _MtnPaymentScreenState extends State<MtnPaymentScreen> {
  String _number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Expanded(
                child: TextField(
                  onChanged: (value) => {
                    setState(() => {_number = value})
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "MTN Number",
                    prefixIcon: Icon(Icons.phone),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),
              SizedBox(width: 20)
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Expanded(
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Text(
                    "Proceed to Pay",
                  ),
                  onPressed: () async {
                    try {
                      final res = await RestAPIService.makePostRequest(
                          {'phonenumber': _number, 'amount': 100}, '',
                          backend: false,
                          url:
                              'https://api.monetbil.com/widget/v2.1/zTMk60wMi2QHbz7XwfYJSwxe3xY4VwDf');
                      print("done");
                    } catch (e) {
                      print(e);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                ),
              ),
              SizedBox(width: 20)
            ],
          )
        ],
      ),
    ));
  }
}
