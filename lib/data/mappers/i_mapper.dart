abstract class IMapper<TModel, TEntity> {
  TModel toModel(TEntity entity);
  TEntity toEntity(TModel model);
}
