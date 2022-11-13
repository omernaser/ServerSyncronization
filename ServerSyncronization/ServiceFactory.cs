namespace ServerSyncronization
{
    public class ServiceFactory
    {
        public ServiceFactory(System.IServiceProvider serviceProvider)
        {
            ServiceProvider = serviceProvider;
        }

        private System.IServiceProvider ServiceProvider { get; }

        public T GetRequiredService<T>() where T : class
        {
            return ServiceProvider.GetRequiredService<T>();
        }
        public T GetService<T>() where T : class
        {
            return ServiceProvider.GetService<T>();

        }
    }
}
