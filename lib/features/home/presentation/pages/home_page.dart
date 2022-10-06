import 'package:finner/common/widgets/bar_chart.dart';
import 'package:finner/common/widgets/dimmed_loading_indicator.dart';
import 'package:finner/features/home/domain/entities/home_page_view_model.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:finner/utils/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/widgets/quick_action_button.dart';
import '../../domain/entities/spending.dart';
import '../blocs/home_page_bloc/home_page_bloc.dart';
import '../widgets/spending_container.dart';
import '../widgets/user_information.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  final _bloc = getIt<HomePageBloc>()..add(const HomePageEvent.load());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
        bloc: getIt<HomePageBloc>(),
        listener: (context, state) {
          state.maybeWhen(
              loaded: (_) {
                refreshController.twoLevelComplete();
              },
              loading: (e) {},
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (e) => _firstPage(context, e, false),
            loading: (e) => Stack(
              children: [
                _firstPage(context, e, true),
                const DimmedLoadingIndicator(),
              ],
            ),
            orElse: () => Container(),
          );
        });
  }

  final refreshController = RefreshController();

  Widget _firstPage(
      BuildContext context, HomePageViewModel model, bool loading) {
    return SmartRefresher(
      controller: loading ? RefreshController() : refreshController,
      onRefresh: () {
        _bloc.add(const HomePageEvent.load());
      },
      header: ClassicHeader(
        height: $styles.insets.offset,
        spacing: 10,
        iconPos: IconPosition.left,
        refreshingText: "",
        refreshingIcon: Container(
          width: MediaQuery.of(context).size.width,
          color: $styles.colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16),
            child: SpinKitDualRing(
              color: $styles.colors.accent3,
            ),
          ),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                _userInformationSection(context, model.user, model.limit),
                _spendingChart(context, model.weekSpendings, model.limit),
              ],
            ),
          ),
          _quickActions(context),
          SizedBox(height: $styles.insets.sm),
          _latestSpendings(context, model.weekSpendings),
        ],
      ),
    );
  }

  Widget _userInformationSection(
      BuildContext context, User? user, double? limit) {
    return Container(
      height: 300,
      padding: EdgeInsets.fromLTRB(
        $styles.insets.md,
        MediaQuery.of(context).padding.top + $styles.insets.md,
        $styles.insets.md,
        0,
      ),
      width: double.maxFinite,
      color: $styles.colors.black,
      child: IntrinsicHeight(
        child: UserInformation(
          user: user,
          spendingLimit: limit,
        ),
      ),
    );
  }

  Widget _spendingChart(
      BuildContext context, List<Spending>? spendings, double? spendingLimit) {
    if (spendings == null) return Container();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200,
        width: double.maxFinite,
        margin: EdgeInsets.all($styles.insets.md),
        padding: EdgeInsets.only(
          top: $styles.insets.md,
          left: $styles.insets.md,
          right: $styles.insets.xs,
        ),
        decoration: BoxDecoration(
          color: $styles.colors.greyBackground,
          borderRadius: BorderRadius.circular(
            $styles.corners.sm,
          ),
        ),
        child: CustomBarChart(
          spendings: spendings,
          spendingLimit: spendingLimit,
        ),
      ),
    );
  }

  Widget _latestSpendings(BuildContext context, List<Spending>? spendings) {
    if (spendings == null) return Container();
    return Padding(
      padding: EdgeInsets.fromLTRB(
        $styles.insets.md,
        0,
        $styles.insets.md,
        $styles.insets.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest activity",
            style: $styles.text.h3,
          ),
          SizedBox(
            height: $styles.insets.md,
          ),
          ...List.generate(
            spendings.length > 2 ? 2 : spendings.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: $styles.insets.sm),
                child: SpendingContainer(
                  spending: spendings[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _quickActions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: SpendingType.ALL.quickActions
            .map((e) => QuickActionButton(quickAction: e))
            .toList(),
      ),
    );
  }
}
