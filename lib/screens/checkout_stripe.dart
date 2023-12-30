import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:fitnessapp/services/stripe_payment.dart';

class AddCardScreen extends StatefulWidget {
  static const id = 'addcard_screen';
  @override
  State<StatefulWidget> createState() {
    return AddCardScreenState();
  }
}

class AddCardScreenState extends State<AddCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  Map data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    RaisedButton(
                      child: Text('Add This Card'),
                      color: Colors.blue,
                      onPressed: () async {
                        data = {
                          "cardHolderName": cardHolderName,
                          "cardNumber": cardNumber,
                          "expiryDate": expiryDate,
                          "cvvCode": cvvCode
                        };
                        await StripePaymentClass.createPaymentMethod(data);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
