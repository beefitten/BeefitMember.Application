import 'package:equatable/equatable.dart';

abstract class CenterInformationEvents extends Equatable {}

class LoadEvent extends CenterInformationEvents {
  final String fitnessName;

  LoadEvent({required this.fitnessName});

  @override
  List<Object?> get props => [fitnessName];
}
