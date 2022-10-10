// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../../../../utils/network.dart';
import '../../domain/data_sources/home_data_source.dart';
import '../../domain/entities/spending.dart';

// Project imports:

@Injectable(as: HomeDataSource)
class DefaultHomeDataSource implements HomeDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore storage;

  DefaultHomeDataSource(
    @Named('firebase_auth') this.auth,
    @Named('firebase_storage') this.storage,
  );

  @override
  Future<Either<Failure, String>> getHome(
    int page,
  ) async {
    return ioSafe(() async {
      return "";
    });
  }

  @override
  Future<Either<Failure, List<Spending>>> getCurrentWeekSpendings() async {
    final cUser = auth.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot = await users.doc(cUser!.uid).collection("spendings").get();
    var spendings =
        snapshot.docs.map((e) => Spending.fromJson(e.data())).toList();
    var monday = mostRecentMonday(DateTime.now())
        .subtract(const Duration(milliseconds: 1));
    var sunday = nextSunday(DateTime.now()).add(const Duration(days: 1));
    final s = spendings.where((element) =>
        element.date.isAfter(monday) && element.date.isBefore(sunday));
    return right(s.toList());
  }

  @override
  Future<Either<Failure, List<Spending>>> getCurrentMonthSpendings() async {
    final cUser = auth.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot = await users.doc(cUser!.uid).collection("spendings").get();
    var spendings =
        snapshot.docs.map((e) => Spending.fromJson(e.data())).toList();
    var firstDay = firstDayOfCurrentMonth();
    var lastDay = lastDayOfMonth();
    final s = spendings.where((element) =>
        element.date.isAfter(firstDay) && element.date.isBefore(lastDay));
    return right(s.toList());
  }

  @override
  Future<Either<Failure, double>> getCurrentMonthSpendingLimit() async {
    final cUser = auth.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot =
        await users.doc(cUser?.uid).collection("monthly_spending_limits").get();
    var limits = snapshot.docs;
    var today = DateTime.now();
    if (limits.any((element) => element.id == "${today.year}_${today.month}")) {
      final l = limits.firstWhere(
          (element) => element.id == "${today.year}_${today.month}");
      if (l.data()["limit"] == null) return left(const Failure("Error"));

      return right((l.data()["limit"] as num).toDouble());
    }
    return left(const Failure("Error"));
  }

  @override
  Future<Either<Failure, bool>> setMonthSpendingLimit(double limit) async {
    final cUser = auth.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot =
        users.doc(cUser!.uid).collection("monthly_spending_limits");
    var today = DateTime.now();
    final l = "${today.year}_${today.month}";

    try {
      await snapshot.doc(l.toString()).set({"limit": limit});
      return right(true);
    } catch (e) {
      return left(const Failure("Error"));
    }
  }

  @override
  Future<Either<Failure, bool>> addSpending(Spending spending) async {
    final cUser = auth.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot = users.doc(cUser!.uid).collection("spendings");
    try {
      await snapshot.add(spending.toJson());
      return right(true);
    } catch (e) {
      return left(const Failure("Error"));
    }
  }
}

DateTime mostRecentMonday(DateTime date) =>
    DateTime(date.year, date.month, date.day - (date.weekday - 1));

DateTime nextSunday(DateTime date) {
  if (date.weekday == 7) return DateTime(date.year, date.month, date.day);
  return DateTime(date.year, date.month, date.day - date.weekday % 7 + 7);
}

DateTime firstDayOfCurrentMonth() {
  final now = DateTime.now();
  var date = DateTime(now.year, now.month, 1).toString();
  return DateTime.parse(date);
}

DateTime lastDayOfMonth() {
  final now = DateTime.now();

  return DateTime(now.year, now.month + 1, 1);
}
