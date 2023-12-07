import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/app.dart';
import 'package:sinus_mpm_application/src/config/routes/controller/auth_guard.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/add_wallet_screen.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/transactions_list_screen.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget with AuthState {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5F7),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 38,
              vertical: 10,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) {
                        //     return const AddWalletScreen();
                        //   },
                        // ));
                        await logOut();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.power_settings_new,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "خروج از پنل کاربری",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const TransactionsScreen();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const LinearBorder(),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/my_trans.png'),
                              height: 22,
                              width: 24,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'تراکنش های من',
                              style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 12),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const LinearBorder(),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/my_account.png'),
                              height: 22,
                              width: 24,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'حساب مالی من',
                              style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: const Color(0xffcccccc),
                          ),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Color(0xff1D43A6),
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "انتخاب عکس پروفایل",
                      style: TextStyle(
                        color: Color(0xff1D43A6),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "مهدی قیصری",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      height: 145,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black.withOpacity(0.09),
                          width: 2,
                        ),
                        color: const Color(0xffEFF0F2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 24,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 4),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Image(
                                  height: 36,
                                  width: 36,
                                  image: AssetImage('assets/images/dimond.png'),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      'موجودی حساب شما',
                                      style: TextStyle(
                                        color: Color(0xff808080),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '290,390,000 ت',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const AddWalletScreen();
                                    },
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 45),
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xff1D43A6)),
                                ),
                              ),
                              child: const Text(
                                'افزایش موجودی',
                                style: TextStyle(
                                  color: Color(0xff1D43A6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black.withOpacity(0.09),
                          width: 2,
                        ),
                        color: const Color(0xffEFF0F2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 24,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              height: 36,
                              width: 36,
                              image: AssetImage('assets/images/lamp.png'),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'موجودی اعتباری',
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '290,390,000 ت',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black.withOpacity(0.09),
                          width: 2,
                        ),
                        color: const Color(0xffEFF0F2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 24,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              height: 36,
                              width: 36,
                              image: AssetImage('assets/images/pig.png'),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'مجموع مشارکت های شما',
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '290,390,000 ت',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
