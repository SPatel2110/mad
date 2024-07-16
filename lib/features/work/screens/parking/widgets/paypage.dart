import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart'; // Import Razorpay package
import 'successscreen.dart'; // Import SuccessScreen

class PayPage extends StatefulWidget {
  final String totalAmount;

  PayPage({required this.totalAmount});

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  late Razorpay _razorpay;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize Razorpay
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Clear Razorpay instance
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    print('Payment success: ${response.paymentId}');

    // Navigate to SuccessScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessScreen(),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print('Payment error: ${response.code} - ${response.message}');
    // Show error message to user or perform retry logic
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Payment Error'),
        content: Text('Failed to process payment. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet (e.g., Paytm) selection
    print('External wallet selected: ${response.walletName}');
  }

  void _openCheckout() {
    var options = {
      'key': 'YOUR_TEST_API_KEY', // Replace with your Razorpay Test API key
      'amount': _calculateAmountInPaisa(), // Example: amount in the smallest currency unit (in paisa)
      'name': 'UrbanPark',
      'description': 'Parking Payment',
      'prefill': {'contact': '9876543210', 'email': 'customer@example.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error initiating payment: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Payment Error'),
          content: Text('Failed to initiate payment. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  int _calculateAmountInPaisa() {
    // Convert totalAmount string to paisa (assuming it's in rupees format like '100 Rupees.00')
    try {
      double rupees = double.parse(widget.totalAmount.split(' ')[0]);
      int paisa = (rupees * 100).round();
      return paisa;
    } catch (e) {
      print('Error parsing amount: $e');
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pay',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Visa **** 6478'),
                    subtitle: Text('Alexander Smith'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(height: 20),
                Text('TOTAL', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text(widget.totalAmount, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)), // Display total amount dynamically
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _openCheckout,
                  child: Text('Pay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
