// Mocks generated by Mockito 5.3.0 from annotations
// in pavo11_flutter/test/data/repositories_impl/news_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pavo11_flutter/data/data_sources/news_remote_source.dart'
    as _i5;
import 'package:pavo11_flutter/data/mappers/news_mapper.dart' as _i7;
import 'package:pavo11_flutter/data/models/news_model.dart' as _i4;
import 'package:pavo11_flutter/domain/entities/news_entity.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeNewsEntity_1 extends _i1.SmartFake implements _i3.NewsEntity {
  _FakeNewsEntity_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeNewsModel_2 extends _i1.SmartFake implements _i4.NewsModel {
  _FakeNewsModel_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [NewsRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRemoteSource extends _i1.Mock implements _i5.NewsRemoteSource {
  MockNewsRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(Invocation.getter(#dio),
      returnValue: _FakeDio_0(this, Invocation.getter(#dio))) as _i2.Dio);
  @override
  _i6.Future<List<_i4.NewsModel>> getLatestNews() => (super.noSuchMethod(
          Invocation.method(#getLatestNews, []),
          returnValue: _i6.Future<List<_i4.NewsModel>>.value(<_i4.NewsModel>[]))
      as _i6.Future<List<_i4.NewsModel>>);
}

/// A class which mocks [NewsMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsMapper extends _i1.Mock implements _i7.NewsMapper {
  MockNewsMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.NewsEntity toEntity(_i4.NewsModel? model) => (super.noSuchMethod(
          Invocation.method(#toEntity, [model]),
          returnValue:
              _FakeNewsEntity_1(this, Invocation.method(#toEntity, [model])))
      as _i3.NewsEntity);
  @override
  _i4.NewsModel toModel(_i3.NewsEntity? entity) =>
      (super.noSuchMethod(Invocation.method(#toModel, [entity]),
              returnValue:
                  _FakeNewsModel_2(this, Invocation.method(#toModel, [entity])))
          as _i4.NewsModel);
}
