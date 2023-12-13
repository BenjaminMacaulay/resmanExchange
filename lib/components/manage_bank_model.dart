import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manage_bank_widget.dart' show ManageBankWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageBankModel extends FlutterFlowModel<ManageBankWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> listOfBanks = [];
  void addToListOfBanks(DocumentReference item) => listOfBanks.add(item);
  void removeFromListOfBanks(DocumentReference item) =>
      listOfBanks.remove(item);
  void removeAtIndexFromListOfBanks(int index) => listOfBanks.removeAt(index);
  void insertAtIndexInListOfBanks(int index, DocumentReference item) =>
      listOfBanks.insert(index, item);
  void updateListOfBanksAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listOfBanks[index] = updateFn(listOfBanks[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<BankDetailsRecord>? banksFound;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
