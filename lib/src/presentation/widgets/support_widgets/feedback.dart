import 'package:aronnax/src/data/interfaces/telemetry.dart';
import 'package:aronnax/src/presentation/widgets/generic_minimal_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/providers/feedback_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeedbackWidget extends ConsumerStatefulWidget {
  const FeedbackWidget({super.key});

  @override
  ConsumerState<FeedbackWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<FeedbackWidget> {
  double rating = 0.0;
  String? feedback;
  @override
  Widget build(BuildContext context) {
    final feedbackData = ref.watch(feedbackProvider);
    return feedbackData.when(
      data: (data) {
        return Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.supportFeedbackTitle,
                  style: Theme.of(context).textTheme.titleLarge),
              const Padding(padding: EdgeInsets.all(10)),
              RatingBar.builder(
                allowHalfRating: true,
                initialRating: data.rating,
                maxRating: 5,
                glowColor: Colors.amber,
                itemBuilder: (context, index) {
                  return const Icon(FontAwesomeIcons.star, color: Colors.amber);
                },
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: data.feedback ??
                        AppLocalizations.of(context)!.supportFeedbackTitle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      feedback = value;
                    });
                  }),
              const Padding(padding: EdgeInsets.all(10)),
              GenericMinimalButton(
                title: AppLocalizations.of(context)!.genericSaveTitle,
                onTap: () async {
                  await ref
                      .read(telemetryRepositoryProvider)
                      .sendUserFeedback(rating, feedback)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content:
                            Text(AppLocalizations.of(context)!.genericThanks),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(error.toString()),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Column(
          children: [
            Text(AppLocalizations.of(context)!.genericErrorMessage),
            Text(
              error.toString(),
            ),
            IconButton(
              onPressed: () => ref.invalidate(feedbackProvider),
              icon: const Icon(Icons.refresh),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
