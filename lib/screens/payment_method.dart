import 'package:fitnessapp/screens/checkout_stripe.dart';
import 'package:fitnessapp/screens/mtn_payment_screen.dart';
import 'package:fitnessapp/services/stripe_payment.dart';
import 'package:fitnessapp/services/toast.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  static const id = 'payment_method_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kBrandColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            decoration: BoxDecoration(
                color: kScaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(250),
                    topLeft: Radius.circular(250))),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    color: kBrandColor,
                    onPressed: () async {
                      try {
                        final sessionId =
                            await StripePaymentClass.createSession();
                        print(sessionId);
                        Navigator.pushNamed(context, AddCardScreen.id);
                      } catch (e, s) {
                        print(e);
                        print(s);
                        ToastMsg.createToast(
                            "Failed to initialize payment. Please try after sometime.");
                      }
                    },
                    child: Text("Pay by Card"),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MtnPaymentScreen.id);
                    },
                    color: kBrandColor,
                    child: Text("Pay through MTN"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
