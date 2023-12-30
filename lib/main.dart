import 'package:fitnessapp/screens/mtn_payment_screen.dart';
import 'package:fitnessapp/screens/mtn_webview.dart';
import 'package:fitnessapp/screens/payment_method.dart';
import 'package:fitnessapp/screens/training_schedule_screen.dart';
import 'package:fitnessapp/screens/video_description.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/registration_screen.dart';
import 'package:fitnessapp/screens/welcome_screen.dart';
import 'package:fitnessapp/screens/login_screen.dart';
import 'screens/subscription.dart';
import 'screens/checkout_stripe.dart';
import 'screens/fitness_journey_screen.dart';
import 'screens/home_screet.dart';
import 'screens/beginner_screen.dart';
import 'screens/intermediate_screen.dart';
import 'package:fitnessapp/screens/advanced_screen.dart';
import 'screens/athlete_screen.dart';
import 'utilities/constants.dart';

void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: kPriamaryColor,
          scaffoldBackgroundColor: kScaffoldBackgroundColor),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SubscriptionScreen.id: (context) => SubscriptionScreen(),
        AddCardScreen.id: (context) => AddCardScreen(),
        FitnessJourneyScreen.id: (context) => FitnessJourneyScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        BeginnerScreen.id: (context) => BeginnerScreen(),
        IntermediateScreen.id: (context) => IntermediateScreen(),
        AdvancedScreen.id: (context) => AdvancedScreen(),
        AthleteScreen.id: (context) => AthleteScreen(),
        TrainingScheduleScreen.id: (context) => TrainingScheduleScreen(),
        PaymentMethodScreen.id: (context) => PaymentMethodScreen(),
        VideoDescription.id: (context) => VideoDescription(),
        MtnPaymentScreen.id: (context) => MtnPaymentScreen(),
        MtnWebViewScreen.id: (context) => MtnWebViewScreen()
      },
    );
  }
}
