import 'package:equatable/equatable.dart';

class CompaniesEntity extends Equatable {
  final int id;
  final String name;
  final String logoPath;

  const CompaniesEntity({
    required this.id,
    required this.name,
    required this.logoPath,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        logoPath,
      ];
}
