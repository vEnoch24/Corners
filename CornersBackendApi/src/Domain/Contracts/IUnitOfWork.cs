namespace CornersBackendApi.src.Domain.Contracts
{
    public interface IUnitOfWork : IDisposable
    {
        IProductRepository ProductRepository { get; }
    }
}
