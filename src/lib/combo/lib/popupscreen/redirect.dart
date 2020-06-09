import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';


class MyHomePage4 extends StatefulWidget {
  //MyHomePage4({Key key, this.title}) : super(key: key);


  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage4> {
  int totalAmount = 23;
  Razorpay _razorpay;

  @override
  void initState() {
    

    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }

@override
  void dispose() { 
    super.dispose();      
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key' : 'rzp_test_XyoHRw6LGnq4bz',
      'amount' : totalAmount*100,
      'name': "Something",
      'description' : 'Test Pay',
      'prefil' : {'contact': '', 'email': ''},
      'external' : {
        'wallets' : ['paytm']
      }
    };

    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint(e);
    }

  }

void _handlePaymentSuccess(PaymentSuccessResponse response){
  Fluttertoast.showToast(msg: "SUCCESS" + response.paymentId);
}

void _handlePaymentError(PaymentFailureResponse response){
  Fluttertoast.showToast(msg: "ERROR" + response.code.toString() + " - " + response.message );
}

void _handleExternalWallet(ExternalWalletResponse response){
  Fluttertoast.showToast(msg: "EXTERNAL WALLET" + response.walletName);
}


  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Raahein"),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            SizedBox(
              height: 15.0,
              
            ),
            RaisedButton(
              color: Colors.teal,
              child: Text("Make Payment",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              ),), onPressed: () {

                openCheckout();


              },
            ),
          ],
      ),
      ), 
    );
  }
}