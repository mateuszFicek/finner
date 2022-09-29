import 'package:finner/common/widgets/dimmed_loading_indicator.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/injectable.dart';
import '../../../utils/router.dart';
import '../../account/presentation/bloc/account_bloc.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _bloc = getIt<AccountBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(const AccountEvent.checkUserStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $styles.colors.accent2,
      body: BlocListener<AccountBloc, AccountState>(
        bloc: _bloc,
        listener: (context, state) {
          state.maybeWhen(
            signedIn: () {
              getIt<FinnerRouter>().replace(const HomeRoute());
            },
            accountError: (e) {
              getIt<FinnerRouter>().replace(const SignInRoute());
            },
            orElse: () {},
          );
        },
        child: Center(
          child: SpinKitDualRing(
            color: $styles.colors.accent3,
          ),
        ),
      ),
    );
  }
}
