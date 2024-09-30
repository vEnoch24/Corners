namespace CornersBackendApi.src.Domain.Contracts
{
    public interface IGenericRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAllAsync();
        IQueryable<T> GetAllAsQueryable();
        Task<T> GetById(Guid id);
        Task<T> Add(T entity);
        Task AddRange(IEnumerable<T> entities);
        Task<bool> Exists(Guid id);
        Task Update(T entity);
        Task Delete(T entity);
        Task Save();
    }
}
