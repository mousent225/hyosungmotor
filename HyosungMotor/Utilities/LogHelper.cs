using log4net;

namespace HyosungMotor.Utilities
{
    public class LogHelper
    {
        private static readonly ILog logger = LogManager.GetLogger("KSOLUTION");

        public static void Info(string mess)
        {
            logger.Info(mess);
        }

        public static void Debug(string mess)
        {
            logger.Debug(mess);
        }

        public static void Error(string mess)
        {
            logger.Error(mess);
        }

        public static void Warn(string mess)
        {
            logger.Warn(mess);
        }

        public static void Fatal(string mess)
        {
            logger.Fatal(mess);
        }
    }
}