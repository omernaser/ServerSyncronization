using System;
using System.IO;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace SampleApp
{
    public partial class App : Application
    {
        public static string LocalDbFullPath = "";
        public App()
        {
            InitializeComponent();

            LocalDbFullPath = Path.Combine(System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal), "test3.db");

            MainPage = new SyncPage();

        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
