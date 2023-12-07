import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/bloc/bloc/auth_bloc.dart';
import 'package:sinus_mpm_application/src/features/create_pool/cubit/create_pool_cubit.dart';

@RoutePage()
class JoinPoolScreen extends StatefulWidget {
  const JoinPoolScreen({super.key});

  @override
  State<JoinPoolScreen> createState() => _JoinPoolScreenState();
}

class _JoinPoolScreenState extends State<JoinPoolScreen> {
  @override
  void initState() {
    context.read<CreatePoolCubit>().getCurrentUserQrCodeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CreatePoolCubit, CreatePoolState>(
        builder: (context, state) {
          if (state is CreatePoolInitial && state.currentUserUserName != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: state.currentUserUserName!,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
