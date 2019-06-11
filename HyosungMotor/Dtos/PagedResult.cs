﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HyosungMotor.Dtos
{
    public class PagedResult<T> : PagedResultBase where T : class
    {
        public PagedResult()
        {
            Results = new List<T>();
        }
        public IList<T> Results { get; set; }
    }
}