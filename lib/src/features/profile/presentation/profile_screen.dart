import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/add_wallet_screen.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/transactions_list_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("نام کاربری"),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const TransactionsScreen();
                  },
                ));
              },
              trailing: Text("لیست تراکنش ها"),
              leading: Icon(Icons.list),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const AddWalletScreen();
                  },
                ));
              },
              trailing: const Text("افزایش موجودی"),
              leading: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
