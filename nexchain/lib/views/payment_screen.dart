import 'package:flutter/material.dart';
import 'package:nexchain/models/payment.dart';
import 'package:nexchain/services/payment_service.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final PaymentService _paymentService = PaymentService();
  Payment? _payment;
  final _paymentIdController = TextEditingController();

  Future<void> _loadPayment(int paymentId) async {
    try {
      final payment = await _paymentService.getPaymentById(paymentId);
      setState(() {
        _payment = payment;
      });
    } catch (e) {
      print('Error loading payment: $e');
    }
  }

  Future<void> _printPaymentDetails() async {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Payment ID: ${_payment!.paymentID}'),
            pw.SizedBox(height: 8.0),
            pw.Text('Payment Account: ${_payment!.paymentAccount}'),
            pw.SizedBox(height: 8.0),
            pw.Text('Payment Amount: ${_payment!.paymentAmount}'),
            pw.SizedBox(height: 8.0),
            pw.Text('Payment Date: ${_payment!.paymentDate.toString()}'),
          ],
        ),
      ),
    );
    await Printing.sharePdf(bytes: await doc.save(), filename: 'payment_details.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _paymentIdController,
              decoration: InputDecoration(
                labelText: 'Enter Payment ID',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final paymentId = int.tryParse(_paymentIdController.text) ?? 0;
                if (paymentId > 0) {
                  _loadPayment(paymentId);
                }
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            if (_payment != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment ID: ${_payment!.paymentID}'),
                  SizedBox(height: 8.0),
                  Text('Payment Account: ${_payment!.paymentAccount}'),
                  SizedBox(height: 8.0),
                  Text('Payment Amount: ${_payment!.paymentAmount}'),
                  SizedBox(height: 8.0),
                  Text('Payment Date: ${_payment!.paymentDate}'),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _printPaymentDetails,
                    child: Text('Print PDF'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}