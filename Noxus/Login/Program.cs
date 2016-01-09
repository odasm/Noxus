using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Engine.Utility;
using Engine.Object;
using Engine.Database;
using Database;

namespace Login
{
    class Program
    {
        public static string ConfigFile = "../Login/LoginConfig.xml";
        public static AccountEntity Entity { get; set; }

        static void Main(string[] args)
        {
            Console.Title = "Noxus Emulator 2016: Login Server";
            
            if (Load())
            {
                Log.IsDebug = Settings.Instance.Debug;

                Log.WriteLine(LogLevel.Info, "LoginServer started.");

                while (true)
                    Console.ReadLine();
            }
            else
            {
                Console.ReadLine();
            }
        }

        public static bool Load()
        {
            if (!Settings.Load(ConfigFile))
            {
                CreateDefaultSettings();
                Settings.Instance.Save(ConfigFile);
            }

            Log.SetLogToFile(string.Format(@"Logs\Login\{0}.log", DateTime.Now.ToString("d_M_yyyy HH_mm_ss")));

            if (Reflector.GetInitializerMethods().Any(method => !method.Invoke()))
            {
                Log.WriteLine(LogLevel.Error, "Server could not be started. Errors occured.");
                return false;
            }
            else return true;
        }

        private static void CreateDefaultSettings()
        {
            Settings.Instance = new Settings()
            {
                Port = 9010,
                Debug = true,
                WorkInterval = 1,
                LoginServiceURI = "net.pipe://localhost/LoginService",
                InterPassword = "noxus",
                DataFolder = "Data",
            };

            Settings.Instance.Entity = new EntitySetting()
            {
                DataSource = "Account",
                DataCatalog = @"DAKARAI-PC\EXINE",
                Metadata = @"res://*/Account.csdl|res://*/Account.ssdl|res://*/Account.msl",
            };
        }
    }
}
