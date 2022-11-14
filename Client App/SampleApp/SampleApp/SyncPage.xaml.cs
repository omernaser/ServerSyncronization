using Dotmim.Sync;
using Dotmim.Sync.Enumerations;
using Dotmim.Sync.Sqlite;
using Dotmim.Sync.Web.Client;
using SampleApp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace SampleApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SyncPage : ContentPage
    {
        public SyncPage()
        {
            InitializeComponent();
        }

        public SyncViewModel VM { get; set; }
        protected override void OnAppearing()
        {

            VM = new SyncViewModel(Navigation);
            BindingContext = VM;
            base.OnAppearing();
        }

        private void Button_Clicked(object sender, EventArgs e)
        {
            //SyncAsync();
        }

        private async void Handle_Clicked(object sender, EventArgs e)
        {
            try
            {
                // Use this when you want to use sqlite on ios
                SQLitePCL.Batteries_V2.Init();

                // 10.0.2.2 is a special url to be able to reach the machine localhost web api
                var serverOrchestrator = new WebClientOrchestrator("http://d-mnofal.esensesoftware.com/ServerSyncronization/api/sync");

                // Path the local sqlite database
                string dbPath = Path.Combine(Xamarin.Essentials.FileSystem.AppDataDirectory, "SqliteDatabase4.db3");

                var clientOptions = new SyncOptions { BatchSize = 5000, ScopeInfoTableName = "scope_info" };

                // Sqlite Client provider
                var clientProvider = new SqliteSyncProvider(dbPath);
                var tables = new string[] { "Documents", "IntegrationUnits", "Offices" };


                // Creating an agent that will handle all the process
                var agent = new SyncAgent(clientProvider, serverOrchestrator, clientOptions);

                var progress = new Progress<ProgressArgs>(args => lblProgress.Text = $"{args.Context.SyncStage}:{args.Message}");

                // Launch the sync process
                var s1 = await agent.SynchronizeAsync(progress);

                // See results
                lblResult.Text = s1.ToString();
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.Message;
            }
        }
    }
}