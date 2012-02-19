using System;
using System.Linq;
using Camelonta.CMS.Web.BaseControls;

namespace HelloWorld.Controls
{
    public partial class ImageGallery : BaseUserControl
    {
        public string GalleryFolder { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(GalleryFolder))
            {
                rpImages.DataSource = CMS.GetFiles(GalleryFolder).Where(f => f.IsImage).ToList();
                rpImages.DataBind();
            }
        }
    }
}