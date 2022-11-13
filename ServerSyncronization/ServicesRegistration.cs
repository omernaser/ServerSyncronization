using Dotmim.Sync;
using Dotmim.Sync.SqlServer;

namespace ServerSyncronization
{
    public static class ServicesRegistration
    {
        public static IServiceCollection AddServicesRegistrations(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddControllers();

            services.AddDistributedMemoryCache();
            services.AddSession(options => {
                options.IdleTimeout = TimeSpan.FromMinutes(30);
                });

            // [Required]: Get a connection string to your server data source
            var connectionString = configuration.GetSection("ConnectionStrings")["SqlConnection"];

            var options = new SyncOptions { };

            // [Required] Tables involved in the sync process:
            var tables = new string[] {"Documents", "IntegrationUnits", "Offices" };
            
            var setup = new SyncSetup(tables) 
            {
                StoredProceduresPrefix = "s",
                StoredProceduresSuffix = "",
                TrackingTablesPrefix = "t",
                TrackingTablesSuffix = "",
                TriggersPrefix = "",
                TriggersSuffix = "t"
            };
          
            var documentsFilter = new SetupFilter("Documents");
            documentsFilter.AddParameter("UserId", "Offices");
            documentsFilter.AddJoin(Join.Inner, "Documents").On("IntegrationUnits","Id", "Documents","Id");
            documentsFilter.AddJoin(Join.Inner, "IntegrationUnits").On("Offices", "Id", "IntegrationUnits", "OfficeId");
            documentsFilter.AddWhere("ManagerId", "Offices", "UserId");
            setup.Filters.Add(documentsFilter);

            // [Required]: Add a SqlSyncProvider acting as the server hub.
            services.AddSyncServer<SqlSyncProvider>(connectionString, setup, options);

            return services;
        }

    }
}
