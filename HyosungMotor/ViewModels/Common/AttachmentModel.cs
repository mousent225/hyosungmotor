
namespace HyosungMotor.ViewModels.Common
{
    public class AttachmentModel
    {
        public int Id { get; set; }
        public int ModuleId { get; set; }
        public int MasterId { get; set; }
        public string Name { get; set; }
        public string Path { get; set; }
        public string Type { get; set; }
        public int? Size { get; set; }
    }
}