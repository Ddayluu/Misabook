﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class User
    {
        // Primary key
        public Guid UserID { get; set; }

        public string UserName { get; set; }

        public string FullName { get; set; }

        public string Password { get; set; }
    }
}
