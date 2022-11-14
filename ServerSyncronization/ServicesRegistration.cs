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
            var tables = new string[] { "Employee", "EmployeeDetails", "Departements" };
            
            var setup = new SyncSetup(tables) 
            {
                StoredProceduresPrefix = "s",
                StoredProceduresSuffix = "",
                TrackingTablesPrefix = "t",
                TrackingTablesSuffix = "",
                TriggersPrefix = "",
                TriggersSuffix = "t"
            };
          
            var documentsFilter = new SetupFilter("Employee");
            documentsFilter.AddParameter("OfficeId", "Departements");
            documentsFilter.AddJoin(Join.Inner, "EmployeeDetails").On("EmployeeDetails", "EmployeeId", "Employee", "Id");
            documentsFilter.AddJoin(Join.Inner, "Departements").On("Departements", "Id", "EmployeeDetails", "DepartmentId");
            documentsFilter.AddWhere("OfficeId", "Departements", "OfficeId");
            setup.Filters.Add(documentsFilter);



            //var documentsFilter1 = new SetupFilter("Documents");
            //documentsFilter1.AddParameter("UserId", "Offices");
            //documentsFilter1.AddJoin(Join.Inner, "Documents").On("IntegrationUnits", "Id", "Documents", "Id");
            //documentsFilter1.AddJoin(Join.Inner, "IntegrationUnits").On("Offices", "Id", "IntegrationUnits", "OfficeId");
            //documentsFilter1.AddWhere("ManagerId", "Offices", "UserId");
            //setup.Filters.Add(documentsFilter1);

            // [Required]: Add a SqlSyncProvider acting as the server hub.
            services.AddSyncServer</*SqlSyncChangeTrackingProvider*/SqlSyncProvider>(connectionString, setup, options);

            return services;
        }

    }
}
