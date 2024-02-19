
import 'package:get_it/get_it.dart';
import 'package:transmedia/data/data_sources/api/api_manager.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source_impl.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source_impl.dart';
import 'package:transmedia/data/repositories/product_repo_impl.dart';
import 'package:transmedia/domain/repositories/product_repository.dart';
import 'package:transmedia/domain/use_cases/product_use_case.dart';
import 'package:transmedia/presentation/pages/home/controllers/home.controller.dart';
import 'package:http/http.dart' as http;
class DependencyInjection {
  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async{

    // ! externs
    getIt.registerFactory(() => http.Client());


    // Register dependencies here

    getIt.registerLazySingleton<APIManager>(() => APIManager(getIt()));


    //getIt.registerFactory<ProductRemoteDatasource>(() => ProductRemoteDatasourceImpl(getIt()));

    getIt.registerLazySingleton<ProductRemoteDatasourceImpl>(() => ProductRemoteDatasourceImpl(getIt()));

    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(getIt()));
    getIt.registerLazySingleton<ProductsUseCase>(() => ProductsUseCase(getIt()));
    getIt.registerLazySingleton<CartLocalDatasource>(() => CartLocalDatasourceImpl(getIt()));
    getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));




  }
}
