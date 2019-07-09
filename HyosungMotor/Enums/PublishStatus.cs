using System.ComponentModel;

namespace HyosungMotor.Enums
{
    public enum PublishStatus
    {
        [Description("Draft")]
        Draft,
        //admin sẽ thấy được trên trang chủ
        [Description("Pending Review")]
        Pending_Review,

        [Description("Published")]
        Published
    }
}