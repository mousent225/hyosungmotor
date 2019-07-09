using HyosungMotor.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HyosungMotor.ViewModels.Product
{
    public class TdStandardMotorViewModel
    {
        public int Id { get; set; }
        public string Kw { get; set; }
        public string Rpm { get; set; }
        public string Voltage { get; set; }
        public string Hz { get; set; }
        public string Frame { get; set; }
        public EnergyEefficiency Efficiency { get; set; }
        public string DataSheet1 { get; set; }
        public string DataSheet2 { get; set; }
        public string OutLine1 { get; set; }
        public string OutLine2 { get; set; }
    }
}