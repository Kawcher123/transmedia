import 'package:get/get.dart';
import 'package:transmedia/data/data_sources/local/sqlite_data_service.dart';
import 'package:transmedia/domain/entities/product_entity.dart';
import 'package:transmedia/domain/use_cases/product_use_case.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController
  final ProductsUseCase _getProductsUseCase;

  HomeController(this._getProductsUseCase);

  final productList = <ProductEntity>[].obs;
  final productLoaded=false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _fetchProducts();
   //int id=await SqliteService.sqliteService.createItem();
   // print('HomeController.onInit:$id');
  }

  Future<void> _fetchProducts() async {

    final result = await _getProductsUseCase.getProductsUseCase();

    result.fold((failure) {}, (products) {
      productList.assignAll(products);
      productLoaded.value=true;
    });
  }
}
