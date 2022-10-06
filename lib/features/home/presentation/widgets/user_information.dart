import 'package:finner/utils/injectable.dart';
import 'package:finner/utils/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../styles/theme_utils.dart';
import '../blocs/home_page_bloc/home_page_bloc.dart';

class UserInformation extends StatelessWidget {
  final User? user;
  final double? spendingLimit;

  const UserInformation({
    Key? key,
    this.user,
    this.spendingLimit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: $styles.insets.md,
              backgroundColor: $styles.colors.accent1,
              foregroundImage: user?.photoURL != null
                  ? NetworkImage(
                      user?.photoURL ?? "",
                    )
                  : null,
            ),
            SizedBox(width: $styles.insets.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome!",
                  style: $styles.text.contentFont
                      .copyWith(color: $styles.colors.white),
                ),
                Text(
                  user?.displayName ?? user?.email ?? "User",
                  style: $styles.text.h3.copyWith(color: $styles.colors.white),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: $styles.insets.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: $styles.insets.xl,
              width: $styles.insets.xl,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
              child: Center(
                child: Icon(
                  Icons.info_outline,
                  color: $styles.colors.offWhite,
                ),
              ),
            ),
            SizedBox(width: $styles.insets.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Monthly spending limit",
                  style: $styles.text.contentFont
                      .copyWith(color: $styles.colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    if (spendingLimit == null) {
                      getIt<FinnerRouter>().push(
                        SpendingLimitSetterRoute(
                          onSet: (value) {
                            getIt<HomePageBloc>()
                                .add(HomePageEvent.setLimit(value));
                            getIt<FinnerRouter>().pop();
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    spendingLimit?.toStringAsFixed(2) ?? "Set spending limit",
                    style:
                        $styles.text.h3.copyWith(color: $styles.colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
