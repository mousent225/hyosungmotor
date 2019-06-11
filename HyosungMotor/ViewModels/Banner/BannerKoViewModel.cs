namespace HyosungMotor.ViewModels.Banner
{
    public class BannerKoViewModel
    {
        public int Id { get; set; }
        public string Heading { get; set; }
        public string SubHeading { get; set; }
        public string Description { get; set; }

        public int MasterId { get; set; }
        public BannerViewModel Banner { get; set; }
    }
}