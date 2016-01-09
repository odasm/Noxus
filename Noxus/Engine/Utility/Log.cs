using System;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace Engine.Utility
{
    public static class Log
    {
        private static readonly Mutex Locker = new Mutex();
        public static bool IsDebug { get; set; }
        public static TextWriter Writer { get; set; }

        public static void WriteLine(LogLevel Level, string Message, params object[] Params)
        {
            if (Level == LogLevel.Debug && !IsDebug) return;
            string header = "[" + DateTime.Now + "] (" + Level + ") ";
            string buffer = String.Format(Message, Params);

            if (Level == LogLevel.Debug)
            {
                Debug.WriteLine(header + buffer);
            }

            Locker.WaitOne();

            try
            {
                Console.ForegroundColor = GetColor(Level);
                Console.Write(header);
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine(buffer);
                if (Writer != null)
                {
                    Writer.WriteLine(header + buffer);
                }
            }
            finally
            {
                Locker.ReleaseMutex();
            }
        }

        public static void SetLogToFile(string FileName)
        {
            Directory.CreateDirectory(FileName.Replace(Path.GetFileName(FileName), ""));
            StreamWriter Stream = new StreamWriter(File.Open(FileName, FileMode.Create, FileAccess.Write, FileShare.Read));
            Stream.AutoFlush = true;
            Writer = Stream;
        }

        private static ConsoleColor GetColor(LogLevel Level)
        {
            switch (Level)
            {
                case LogLevel.Info:
                    return ConsoleColor.Green;
                case LogLevel.Warning:
                    return ConsoleColor.Yellow;
                case LogLevel.Error:
                    return ConsoleColor.DarkRed;
                case LogLevel.Exception:
                    return ConsoleColor.Red;
                case LogLevel.Debug:
                    return ConsoleColor.Magenta;
                default:
                    return ConsoleColor.White;
            }
        }
    }

    // might add this to the enum group later on, slight ocd
    public enum LogLevel : byte
    {
        Default,
        Info,
        Warning,
        Error,
        Exception,
        Debug
    }
}
