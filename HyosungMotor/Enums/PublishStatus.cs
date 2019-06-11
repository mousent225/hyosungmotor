using System.ComponentModel;

namespace HyosungMotor.Enums
{
    public enum PublishStatus
    {
        [Description("Draft")]
        Draft,

        [Description("Pending Review")]
        Pending_Review,

        [Description("Published")]
        Published
    }
}