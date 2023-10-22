import 'package:alquran_api/features/dashboard/presentation/view/section/dashboard_view.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardView(
        uid: uid,
      ),
    );
  }
}
