import 'dart:convert';
import 'package:fitnessapp/services/rest_api_service.dart';
import 'package:fitnessapp/services/use_disk_space.dart';
import 'package:fitnessapp/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripePaymentClass {
  static Future createPaymentMethod(cardObject) async {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey:
            "pk_test_51H6kE3FGnI1zKRtpqHdeOPN0jvTKDNgCIU3P9LnQGLNlp0UWJMDWov3sHPySxlBrECWAZB6nMcvJTdel1arlWmtF00OngFgvZ1",
      ),
    );
    final paymentMethod = await StripePayment.createPaymentMethod(
      PaymentMethodRequest(
        card: CreditCard(
            number: cardObject['cardNumber'],
            expMonth: int.parse(cardObject['expiryDate'].split('/')[0]),
            expYear: int.parse(cardObject['expiryDate'].split('/')[1])),
      ),
    );
    print(paymentMethod.id);
    print("Starting");
    await createSubscription({
      "customerId": "cus_HxcOu5kGhvaPTW",
      "paymentMethodId": paymentMethod.id,
      "priceId": "price_1HNQn3FGnI1zKRtp9faSgVoe"
    });
    print("done");
  }

  static Future createSession() async {
    try {
      final tk = await UseDisk.readData("token");
      final data = {"token": tk};
      await RestAPIService.makePostRequest(data, '/create-session');
    } catch (e) {
      throw Error();
    }
  }

  static Future createSubscription(subscriptionObject) async {
    try {
      final response = await http.post('$kBackendUrl/create-subscription',
          headers: {"Content-Type": "application/json"},
          body: json.encode(subscriptionObject));
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
