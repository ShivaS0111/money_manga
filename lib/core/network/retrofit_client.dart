
import 'package:dio/dio.dart' hide Headers;
import 'package:money_manga/config/_api.dart';
import 'package:money_manga/core/network/response/git_search_response.dart';
import 'package:money_manga/core/network/response/product_list_response.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(Api.getOfflineProducts)
  @FormUrlEncoded()
  Future<ProductListResponse> getOfflineProducts(@Field('data') String data);

  @GET(Api.gitSearch)
  Future<GitSearchResponse> gitSearch(@Path() String language);

/*@POST("http://httpbin.org/post")
  Future<void> createNewTaskFromFile(@Part() File file);

  @Headers(<String, String>{"accept": "image/jpeg"})
  @GET("http://httpbin.org/image/jpeg")
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getFile();

  @POST("http://httpbin.org/post")
  @FormUrlEncoded()
  Future<String> postUrlEncodedFormData(@Field() String hello);

  @HEAD('/')
  Future<String> headRequest();

  @HEAD('/')
  Future headRequest2();

  @HEAD('/')
  Future<HttpResponse> headRequest3();

  @GET("/task/group")
  Future<List<TaskGroup>> groupedTaskByDate();

  @GET("/task")
  Future<HttpResponse<List<Task>>> getTasksWithResponse();

  @DELETE("/tasks/{id}")
  Future<HttpResponse<void>> deleteTaskWithResponse(@Path() String id);

  @POST("/post")
  Future<String> postFormData(@Part() Task task, {@Part() File file});

  @POST("/post")
  Future<String> postFormData2(@Part() List<Map<String, dynamic>> task,
      @Part(contentType: 'application/json') File file);

  @POST("/post")
  Future<String> postFormData3(
      {@Part(value: "customFiles", contentType: 'application/json')
          List<File> files,
      @Part() File file});

  @POST("/post")
  Future<String> postFormData4(@Part() List<Task> tasks, @Part() File file);

  @POST("/post")
  Future<String> postFormData5(
    @Part() List<Task> tasks,
    @Part() Map<String, dynamic> map,
    @Part() int a, {
    @Part() bool b,
    @Part() double c,
    @Part() String d,
  });

  @GET('/demo')
  Future<String> queries(@Queries() Map<String, dynamic> queries);

  @GET("/get")
  Future<String> namedExample(@Query("apikey") String apiKey,
      @Query("scope") String scope, @Query("type") String type,
      {@Query("from") int from});

  @POST("/postfile")
  @Headers(<String, dynamic>{
    "Content-Type": "application/octet-stream",
    "Ocp-Apim-Subscription-Key": "abc"
  })
  Future<String> postFile({@Body() File file});

  @GET("")
  Future<String> testCustomOptions(@DioOptions() Options options);*/
}
