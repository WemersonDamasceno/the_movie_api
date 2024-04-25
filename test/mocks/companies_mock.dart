import 'package:the_movies_db/data/models/companies_model.dart';
import 'package:the_movies_db/domain/entities/companies_entity.dart';

class CompaniesMock {
  static CompaniesModel model = const CompaniesModel(
    idModel: 1,
    logoPathModel: '/logoPath.png',
    nameModel: 'Company Name',
  );

  static CompaniesEntity entity = CompaniesEntity(
    id: model.idModel,
    logoPath: model.logoPathModel,
    name: model.nameModel,
  );
}
