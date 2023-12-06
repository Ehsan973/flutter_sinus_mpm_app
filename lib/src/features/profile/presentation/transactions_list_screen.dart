import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
@RoutePage()
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    children: [
                      Text("تاریخ تراکمش"),
                      Spacer(),
                      Text("مبلغ"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("وضعیت"),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
