import 'dart:async';

import 'package:aronnax/src/data/interfaces/local_database_interface.dart';
import 'package:aronnax/src/data/interfaces/telemetry.dart';
import 'package:aronnax/src/data/providers/updates_provider.dart';
import 'package:aronnax/src/presentation/main_menu/widgets/telemetry_dialog.dart';
import 'package:aronnax/src/presentation/widgets/update_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aronnax/src/data/interfaces/calendar_repository_interface.dart';
import 'package:aronnax/src/data/providers/appointments_provider.dart';
import 'package:aronnax/src/data/providers/connection_state_provider.dart';
import 'package:aronnax/src/data/providers/consultations_provider.dart';
import 'package:aronnax/src/data/providers/todos_provider.dart';
import 'package:aronnax/src/domain/entities/calendar_event.dart';
import 'package:aronnax/src/presentation/core/methods.dart';
import 'package:aronnax/src/presentation/core/user_global_values.dart';
import 'package:aronnax/src/presentation/main_menu/menu_options_bar.dart';
import 'package:aronnax/src/presentation/patiens_view/patients_view.dart';
import 'package:aronnax/src/presentation/treatment_plans/treatment_plans_view/treatment_plans_view.dart';
import 'package:aronnax/src/presentation/appointment_creation/appointment_creation_dialog.dart';
import 'package:aronnax/src/presentation/widgets/calendar_components/events_list_view.dart';
import 'package:aronnax/src/presentation/widgets/generic_icon_button.dart';
import 'package:aronnax/src/presentation/widgets/global_calendar.dart';
import 'package:aronnax/src/presentation/widgets/todo_creation_dialog/todos_creation_dialog.dart';
import 'package:aronnax/src/presentation/widgets/todos_list_view/todos_list_view.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MainMenu extends ConsumerStatefulWidget {
  const MainMenu({super.key});

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
  void initState() {
    Future(() async {
      final settings =
          await ref.read(localDatabaseRepositoryProvider).getLocalSettings();
      final ableToShowTelemetryDialog =
          settings.installationId == null && !settings.isTelemetryEnabled;
      if (ableToShowTelemetryDialog) {
        Future.delayed(
          const Duration(seconds: 2),
          () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return const TelemetryDialog();
            },
          ),
        );
      }
      if (settings.installationId != null && settings.isTelemetryEnabled) {
        await ref.read(telemetryRepositoryProvider).updateUserStats();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String professionalNames = ref.read(globalUserInformationProvider)!.names;
    String finalGreet = AppMethods()
        .showMainMenuGreet(context, DateTime.now().hour, professionalNames);

    final eventsList = ref.watch(appointmentsGlobalListProvider(ref));
    final todosList = ref.watch(todosListProvider);
    final updateData = ref.watch(updateDataProvider);

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 6),
                                        blurRadius: 3,
                                        color:
                                            Color.fromARGB(255, 222, 222, 222))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      finalGreet,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.23,
                                        child: Text(
                                          DateFormat('dd/MM/yyyy').format(
                                                      ref.watch(
                                                          selectedDateProvider)) ==
                                                  DateFormat('dd/MM/yyyy')
                                                      .format(DateTime.now())
                                              ? AppLocalizations.of(context)!
                                                  .mainMenuEventsForToday
                                              : '${AppLocalizations.of(context)!.mainMenuEventsForDefinedDate} ${DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode).format(ref.watch(selectedDateProvider))}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ),
                                      IconButton(
                                        tooltip: AppLocalizations.of(context)!
                                            .mainMenuAddEventTooltip,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                AppointmentCreationDialog(
                                              eventData: null,
                                              selectedDate: ref
                                                  .read(selectedDateProvider),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      child: eventsList.when(
                                        data: (data) {
                                          List<CalendarEvent> filtedEventsList =
                                              ref
                                                  .read(
                                                      calendarRepositoryProvider)
                                                  .filterEventsByDate(
                                                    data,
                                                    ref.watch(
                                                        selectedDateProvider),
                                                  );
                                          return EventsListView(
                                              filtedEventsList:
                                                  filtedEventsList);
                                        },
                                        error: (error, stackTrace) => Text(
                                            AppLocalizations.of(context)!
                                                .genericErrorMessage),
                                        loading: () =>
                                            const CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: const GlobalCalendar(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GenericIconButton(
                              icon: FontAwesomeIcons.book,
                              title: AppLocalizations.of(context)!
                                  .treatmentPlansMenuTitle,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TreatmentPlansView(),
                                  ),
                                );
                              },
                            ),
                            GenericIconButton(
                              icon: FontAwesomeIcons.microscope,
                              title:
                                  AppLocalizations.of(context)!.testsMenuTitle,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text('Muy pronto'),
                                  ),
                                );
                              },
                            ),
                            GenericIconButton(
                              icon: FontAwesomeIcons.userGroup,
                              title: AppLocalizations.of(context)!
                                  .patientsListMenuTitle,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PatientsView(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 500,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .tasksMenuTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                    ),
                                    IconButton(
                                      tooltip: AppLocalizations.of(context)!
                                          .taskMenuAddButton,
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const TodosCreationDialog(),
                                      ),
                                      icon: const Icon(
                                          FontAwesomeIcons.squarePlus),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: todosList.when(
                                    data: (data) =>
                                        TodosListView(todosList: data),
                                    error: (error, stackTrace) => Text(
                                        AppLocalizations.of(context)!
                                            .genericErrorMessage),
                                    loading: () =>
                                        const CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const MenuOptionsBar(),
            Visibility(
              visible: ref.watch(displayUpdateAnoucement),
              child: Align(
                alignment: Alignment.bottomRight,
                child: updateData.when(
                  data: (data) {
                    if (data != null) {
                      return UpdateItem(updateData: data);
                    } else {
                      return const SizedBox();
                    }
                  },
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
