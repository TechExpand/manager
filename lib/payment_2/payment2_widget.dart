import 'dart:convert';

import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:manager/gigs/gigs_widget.dart';

import '../components/process_payment_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';





class Payment2Widget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleState();
  }
}

class MySampleState extends State<Payment2Widget> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: !useBackgroundImage
                ? const DecorationImage(
              image: ExactAssetImage('assets/bg.png'),
              fit: BoxFit.fill,
            )
                : null,
            color: Colors.white70,
          ),
          child:  ListView(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: const Color(0xFF4B39EF),
                  backgroundImage:
                  useBackgroundImage ? 'assets/card_bg.png' : null,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
             SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Color(0xFF4B39EF),
                          textColor: Colors.black,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color:  Colors.black,),
                            labelStyle: const TextStyle(color:  Colors.black,),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color:  Colors.black,),
                            labelStyle: const TextStyle(color:  Colors.black,),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color:  Colors.black,),
                            labelStyle: const TextStyle(color:  Colors.black,),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color:  Colors.black,),
                            labelStyle: const TextStyle(color:  Colors.black,),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              primary: const Color(0xFF4B39EF),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              child: const Text(
                                'PROCEED',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'halter',
                                  fontSize: 14,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                            onPressed: () async{
                              if (formKey.currentState.validate()){
                                await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: ProcessPaymentWidget(
                                      cvc: cvvCode,
                                      cardMonth: expiryDate.substring(0,2),
                                      cardYear: expiryDate.substring(3, expiryDate.length),
                                      cardNumber: cardNumber,
                                    ),
                                  );
                                },
                              );
                              } else {
                                print('invalid!');
                              }
                            },
                          ),
                        ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8.0),
                     ),
                     primary: const Color(0xFF4B39EF),
                   ),
                   child: Container(
                     margin: const EdgeInsets.all(12),
                     child: const Text(
                       'CANCEL',
                       style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'halter',
                         fontSize: 14,
                         package: 'flutter_credit_card',
                       ),
                     ),
                   ),
                   onPressed: () async{
                     Navigator.pushAndRemoveUntil(
                       context,
                       MaterialPageRoute(
                         builder: (context) => GigsWidget(),
                       ),
                           (r) => false,
                     );
                   },
                 ),
               ),

                      ],
                    ),

                ),
              ],
          ),
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
