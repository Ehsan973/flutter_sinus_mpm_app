import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'لیست استخر های من',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 27),
              // const Text(
              //   ,
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      height: 215,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PoolListItem(
                            title: 'عنوان استخر',
                            text: 'پیک نیک روز عید غدیر',
                          ),
                          PoolListItem(
                            title: 'نقش من',
                            text: 'مادرخرج',
                          ),
                          PoolListItem(
                            title: 'زمان عملیات',
                            text: '۱۴۰۰/۰۲/۱۵',
                          ),
                          PoolListItem(
                            title: 'جمع کل',
                            text: '۳۴,۵۰۰,۰۰۰',
                          ),
                          PoolListItem(
                            title: 'سهم من',
                            text: '۴,۵۰۰,۰۰۰ (۲۹٪)',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PoolListItem extends StatelessWidget {
  const PoolListItem({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xff666666)),
          ),
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xff333333),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
