import 'package:aronnax/src/presentation/widgets/support_widgets/bug_report_widget.dart';
import 'package:aronnax/src/presentation/widgets/support_widgets/feedback.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeedbackWidget(),
              Padding(padding: EdgeInsets.all(30)),
              BugReportWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
