import 'package:agenda_contatos/modules/contacts/domain/usecases/create_contact.dart';
import 'package:agenda_contatos/modules/contacts/domain/usecases/delete_contact.dart';
import 'package:agenda_contatos/modules/contacts/domain/usecases/read_contact.dart';
import 'package:agenda_contatos/modules/contacts/domain/usecases/update_contact.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../modules/contacts/data/datasources/firebase_datasource.dart';
import '../modules/contacts/data/repositories/contact_repository.dart';
import '../modules/contacts/presentation/cubit/contact_cubit.dart';

final getIt = GetIt.instance;

void setupInjector() {
  // Firebase
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // DataSource
  getIt.registerLazySingleton(
      () => FirebaseDataSource(getIt<FirebaseFirestore>()));

  // Repository
  getIt.registerLazySingleton(
      () => ContactRepository(getIt<FirebaseDataSource>()));

  // Cubit
  getIt.registerFactory(() => ContactCubit(getIt<ContactRepository>(),
      createContactUseCase: CreateContact(
          ContactRepository(FirebaseDataSource(FirebaseFirestore.instance))),
      readContactsUseCase: ReadContacts(
          ContactRepository(FirebaseDataSource(FirebaseFirestore.instance))),
      updateContactUseCase: UpdateContact(
          ContactRepository(FirebaseDataSource(FirebaseFirestore.instance))),
      deleteContactUseCase: DeleteContact(
          ContactRepository(FirebaseDataSource(FirebaseFirestore.instance)))));
}
