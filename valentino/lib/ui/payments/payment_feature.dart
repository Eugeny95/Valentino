import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_core.dart';
import 'package:sberbank_acquiring/sberbank_acquiring_ui.dart';

class Payment {
  final SberbankAcquiring acquiring = SberbankAcquiring(
    SberbankAcquiringConfig.credential(
      userName: 't3662276447_180224-api',
      password: 'Q.7rCcUQ',
      isDebugMode: false,
    ),
  );
  Future<void> webviewPayment1(BuildContext context, int amount) async {}
  Future<void> webviewPayment(BuildContext context, int amount) async {
    final RegisterResponse register = await acquiring.register(
      RegisterRequest(
        amount: amount,
        returnUrl: 'https://smitrus.ru',
        failUrl: 'https://smitrus.ru',
        orderNumber: '118371439847893749iuoiijlj328472398',
        pageView: 'MOBILE',
      ),
    );

    final String? formUrl = register.formUrl;
    print('form url !!!');

    if (!register.hasError && formUrl != null) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Scaffold(
            body: WebViewPayment(
              logger: acquiring.logger,
              formUrl: formUrl,
              returnUrl: 'https://test.ru/return.html',
              failUrl: 'https://test.ru/fail.html',
              onLoad: (bool v) {
                debugPrint('WebView load: $v');
              },
              onError: () {
                debugPrint('WebView Error');
              },
              onFinished: (String? v) async {
                final GetOrderStatusExtendedResponse status =
                    await acquiring.getOrderStatusExtended(
                  GetOrderStatusExtendedRequest(orderId: v),
                );

                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      );
    }
  }
}
