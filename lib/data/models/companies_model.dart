import 'package:the_movies_api/core/utils/constants/the_movie_constants.dart';
import 'package:the_movies_api/domain/entities/companies_entity.dart';

class CompaniesModel extends CompaniesEntity {
  final int idModel;
  final String nameModel;
  final String logoPathModel;

  const CompaniesModel({
    required this.idModel,
    required this.nameModel,
    required this.logoPathModel,
  }) : super(
          id: idModel,
          name: nameModel,
          logoPath: logoPathModel,
        );

  factory CompaniesModel.fromJson(Map<String, dynamic> json) {
    return CompaniesModel(
      nameModel: json['name'],
      logoPathModel: "${TheMoviesConstants.baseUrlImage}${json['logo_path']}",
      idModel: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': idModel,
      'name': nameModel,
      'logo_path': logoPathModel,
    };
  }

  CompaniesModel copy({
    int? id,
    String? name,
    String? logoPath,
  }) {
    return CompaniesModel(
      idModel: id ?? idModel,
      nameModel: name ?? nameModel,
      logoPathModel: logoPath ?? logoPathModel,
    );
  }
}
