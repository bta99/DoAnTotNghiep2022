import 'package:doantotnghiep/Models/demoModels/demo_model.dart';
import 'package:doantotnghiep/Services/Api/api_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'demo.g.dart';

@RestApi()
abstract class DemoService {
  factory DemoService(Dio dio, {String baseUrl}) = _DemoService;

  factory DemoService.client({bool? isLoading}) {
    return DemoService(ClientApi().initDio());
  }

  @GET("/posts")
  Future<List<DemoModels>> getUsers();
}
