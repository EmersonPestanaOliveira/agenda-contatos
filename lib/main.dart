import 'package:agenda_contatos/core/injector.dart';
import 'package:agenda_contatos/firebase_options.dart';
import 'package:agenda_contatos/modules/contacts/presentation/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupInjector(); // registra todas as dependências no GetIt

  runApp(
    BlocProvider(
      create: (_) => getIt<ContactCubit>(),
      child: const MyApp(),
    ),
  );
}
