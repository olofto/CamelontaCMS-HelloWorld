using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelloWorld.MasterPages
{
    public partial class HelloWorld : Camelonta.CMS.Web.BaseControls.BaseMasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetSiteLogo()
        {
            string part1 = CMS.Context.GetSiteProperty("SiteLogo/Part1");
            string part2 = CMS.Context.GetSiteProperty("SiteLogo/Part2");

            if (string.IsNullOrEmpty(part1))
                part1 = "Hello";

            if (string.IsNullOrEmpty(part2))
                part2 = "World";

            return string.Format("{0}<span class=\"green\">{1}</span>", part1, part2);
        }
    }
}
