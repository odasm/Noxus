namespace Login.Network
{
    public static class OpCode
    {
        public struct Client
        {
            public enum H3 : byte
            {
                Version = 0,
                Login = 0,
                WorldReRequest = 0,
                FileHash = 0,
                WorldSelect = 0,
                BackToWorldSelect = 0,
                GameLogout = 0,
            }
        }

        public struct Server
        {
            public enum H3 : byte
            {
                IncorrectVersion = 0,
                VersionAllowed = 0,
                FilecheckAllow = 0,
                Error = 0,
                WorldListNew = 0,
                WorldServerIP = 0,
                WorldListResend = 0,
                BackToWorldSelect = 0,
            }
        }
    }
}
