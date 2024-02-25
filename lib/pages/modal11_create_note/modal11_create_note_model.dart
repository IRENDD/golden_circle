import '/backend/backend.dart';
import '../../map_settings/map_settings_theme.dart';
import '../../map_settings/map_settings_util.dart';
import '../../map_settings/map_settings_widgets.dart';
import 'modal11_create_note_widget.dart' show Modal11CreateNoteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Modal11CreateNoteModel extends FlutterFlowModel<Modal11CreateNoteWidget> {
  ///  Local state fields for this component.

  EventsCollectionRecord? eventPick;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
