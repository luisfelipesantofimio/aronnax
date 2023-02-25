import 'dart:developer';

import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/options_bar.dart';
import 'package:aronnax/src/presentation/widgets/calendar_components/events_list_view.dart';
import 'package:aronnax/src/presentation/widgets/global_calendar.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MainMenu extends ConsumerStatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends ConsumerState<MainMenu> {
  @override
  void didChangeDependencies() {
    if (!ref.watch(offlineStatusProvider).value!) {
      ref.read(globalQueriedPatientProvider.notifier).getPatientInfo();
      ref.read(globalQueriedClinicHistoryProvider.notifier).getPatientInfo();
      ref
          .read(globalQueriedSessionsProvider.notifier)
          .fetchCurrentSessionData();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String professionalNames = ref.read(globalUserInformationProvider)!.names;
    String finalGreet = AppMethods().showMainMenuGreet(DateTime.now().hour);

    final eventsList = ref.watch(appointmentsGlobalListProvider(ref));

    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //const MainHeader(),

            // Text("$finalGreet $professionalNames ¿Qué deseas hacer?",
            //     style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // const SizedBox(width: 300, child: MainMenuOptions()),
                  SizedBox(
                    child: Container(
                      alignment: Alignment.center,
                      width: 500,
                      child: const OptionsBar(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            right: 10,
                          ),
                          child: GlobalCalendar(),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            DateFormat('dd/MM/yyyy').format(
                                        ref.watch(selectedDateProvider)) ==
                                    DateFormat('dd/MM/yyyy')
                                        .format(DateTime.now())
                                ? 'Eventos para hoy'
                                : 'Eventos del ${DateFormat.yMMMMEEEEd('es').format(ref.watch(selectedDateProvider))}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            right: 10,
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: eventsList.when(
                              data: (data) {
                                List<CalendarEvent> filtedEventsList = ref
                                    .read(calendarRepositoryProvider)
                                    .filterEventsByDate(
                                      data,
                                      ref.watch(selectedDateProvider),
                                    );
                                return EventsListView(
                                    filtedEventsList: filtedEventsList);
                              },
                              error: (error, stackTrace) =>
                                  const Text('Something went wrong.'),
                              loading: () => const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
