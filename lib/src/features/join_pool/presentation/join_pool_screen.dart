import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
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
    //TODO implement directionality
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocBuilder<CreatePoolCubit, CreatePoolState>(
          builder: (context, state) {
            if (state is CreatePoolInitial &&
                state.currentUserUserName != null) {
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
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text(
                          'از صاحب استخر بخواهید بارکد آیدی شما را اسکن کرده یا آیدی شما را به استخر دعوت کند. سپس با اسکن بارکد استخر در آن شنا کنید!'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: OutlinedButton.icon(
                              style: ButtonStyle(
                                fixedSize: const MaterialStatePropertyAll(
                                  Size.fromHeight(46),
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                context.router.push(
                                  QRViewRoute(
                                    isForJoin: true,
                                    afterCompleteScan: (p0) {},
                                  ),
                                );
                              },
                              icon: state is CreatePoolLoading
                                  ? const CircularProgressIndicator()
                                  : const Icon(Icons.qr_code_scanner_rounded),
                              label: state is CreatePoolLoading
                                  ? const LinearProgressIndicator()
                                  : const Text('شیرجه زدن'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
