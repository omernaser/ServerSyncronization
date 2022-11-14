
using Dotmim.Sync;
using Dotmim.Sync.Enumerations;
using Dotmim.Sync.Sqlite;
using Dotmim.Sync.Web.Client;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;

namespace SampleApp
{

   public class SyncViewModel
    {

        public SyncViewModel() { }

        public SyncViewModel(INavigation navigation)
        {
            _navigation = navigation;
            SyncCommand = new Command(async () => await SyncAsync(), () => canSync);
            

        }

        private INavigation _navigation;

        public string ValidationMessage { get; set; }

        public string RemoteValidationMessage { get; set; }

        #region "Sync"
        bool canSync = true;

        void CanInitiateSync(bool value)
        {
            canSync = value;
            ((Command)SyncCommand).ChangeCanExecute();
        }

        public ICommand SyncCommand { get; private set; }

      public  async Task SyncAsync()
        {
            try
            {

                string ServerAPIUrl = "http://d-mnofal.esensesoftware.com/ServerSyncronization/api/sync";
                
                string ServerIP = "203.134.204.146";
                string DBName = "LTD";
                string DBUserID = "sa";
                string DBPassword = "THEWOODS";

                CanInitiateSync(false);
                ValidationMessage = "";

                string APIString = ServerAPIUrl;//+ "sync?Server=" + ServerIP + "&DBName=" + DBName + "&UserID=" + DBUserID + "&Password=" + DBPassword + "&CustomFilter=ID > 0 And ID < 100";

                var handler = new HttpClientHandler { AutomaticDecompression = DecompressionMethods.None };
                var client = new HttpClient(handler) { Timeout = TimeSpan.FromMinutes(30) };

                var RemoteServerProvider = new WebClientOrchestrator(APIString, null, null, client);
                var clientProvider = new SqliteSyncProvider(App.LocalDbFullPath);

                var progress = new SynchronousProgress<ProgressArgs>(args => ValidationMessage = ($"{args.Context.SyncStage}:{args.Message}"));

                // "Accounts", "Item", "Series", "Transactions", "ItemDataFooter" 
                var tables = new string[] { "Accounts" };

                var syncSetup = new SyncSetup(tables);

                var clientOptions = new SyncOptions {  DisableConstraintsOnApplyChanges = true, ConflictResolutionPolicy = ConflictResolutionPolicy.ServerWins, BatchSize=2000, UseBulkOperations=true, ScopeInfoTableName = "masterscopetable" };

                var agent = new SyncAgent(clientProvider, RemoteServerProvider, clientOptions, syncSetup);
                                
                var s1 = await agent.SynchronizeAsync(Dotmim.Sync.Enumerations.SyncType.Normal, progress);

                CanInitiateSync(true);
            }
            catch (Exception e)
            {
                ValidationMessage = e.Message;
                CanInitiateSync(true);
            }
        }
        #endregion


        

    }
}


