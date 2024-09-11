namespace CornersBackendApi.Data.Models
{
    public class Transaction
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string Name { get; set; }
        public double Amount { get; set; }
        public string TrxRef { get; set; }
    }
}
