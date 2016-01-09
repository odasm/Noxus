using System;
using System.IO;
using System.Xml.Serialization;

using Engine.Utility;
using Engine.Database;

namespace Login
{
    public sealed class Settings
    {
        public const int SettingsVersion = 1;

        public int? Version { get; set; }
        public ushort Port { get; set; }
        public bool Debug { get; set; }
        public int WorkInterval { get; set; }

        public string LoginServiceURI { get; set; }
        public string InterPassword { get; set; }
        public ushort InterServerPort { get; set; }

        public string DataFolder { get; set; }

        public EntitySetting Entity { get; set; }

        public static Settings Instance { get; set; }
        
        public void Save(string Path)
        {
            using (var file = File.Create(Path))
            {
                XmlSerializer XSer = new XmlSerializer(typeof(Settings));
                XSer.Serialize(file, this);
            }
        }

        public static bool Load(string Path)
        {
            if (!File.Exists(Path)) return false;
            
            Settings Object;
            
            try
            {
                using (var file = File.Open(Path, FileMode.Open))
                {
                    XmlSerializer XSer = new XmlSerializer(typeof(Settings));
                    Object = (Settings)XSer.Deserialize(file);
                }

                if (Object.DataFolder == null)
                {
                    Object.DataFolder = "Data";
                    Object.Save(Path);
                }

                if (!Object.Version.HasValue || Object.Version.Value != SettingsVersion)
                {
                    if (!Object.Version.HasValue)
                    {
                        Object.InterServerPort = 10000;
                    }

                    Object.Version = SettingsVersion;
                    Object.Save(Path);
                }

                Settings.Instance = Object;
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
