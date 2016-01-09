using Engine.Object;
using Engine.Database;

namespace Database
{
    public static class EntityFactory
    {
        public static AccountEntity GetAccountEntity(EntitySetting setting)
        {
            string connectionstring = ConnectionStringBuilder.CreateEntityString(setting);
            return new AccountEntity(connectionstring);
        }

        public static WorldEntity GetWorldEntity(EntitySetting setting)
        {
            string connectionstring = ConnectionStringBuilder.CreateEntityString(setting);
            return new WorldEntity(connectionstring);
        }

        public static WorldEntity GetWorldEntity(string connection)
        {
            return new WorldEntity(connection);
        }
    }
}
