import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsCollectionRecord extends FirestoreRecord {
  EventsCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "eventID" field.
  String? _eventID;
  String get eventID => _eventID ?? '';
  bool hasEventID() => _eventID != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Participants" field.
  int? _participants;
  int get participants => _participants ?? 0;
  bool hasParticipants() => _participants != null;

  // "eventDetails" field.
  String? _eventDetails;
  String get eventDetails => _eventDetails ?? '';
  bool hasEventDetails() => _eventDetails != null;

  void _initializeFields() {
    _eventName = snapshotData['eventName'] as String?;
    _eventID = snapshotData['eventID'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _participants = castToType<int>(snapshotData['Participants']);
    _eventDetails = snapshotData['eventDetails'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events_collection');

  static Stream<EventsCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsCollectionRecord.fromSnapshot(s));

  static Future<EventsCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EventsCollectionRecord.fromSnapshot(s));

  static EventsCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventsCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsCollectionRecordData({
  String? eventName,
  String? eventID,
  LatLng? location,
  int? participants,
  String? eventDetails,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventName': eventName,
      'eventID': eventID,
      'Location': location,
      'Participants': participants,
      'eventDetails': eventDetails,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsCollectionRecordDocumentEquality
    implements Equality<EventsCollectionRecord> {
  const EventsCollectionRecordDocumentEquality();

  @override
  bool equals(EventsCollectionRecord? e1, EventsCollectionRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.eventID == e2?.eventID &&
        e1?.location == e2?.location &&
        e1?.participants == e2?.participants &&
        e1?.eventDetails == e2?.eventDetails;
  }

  @override
  int hash(EventsCollectionRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.eventID,
        e?.location,
        e?.participants,
        e?.eventDetails
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsCollectionRecord;
}
