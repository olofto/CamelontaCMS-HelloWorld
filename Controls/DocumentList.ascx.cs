using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using Camelonta.CMS.Hosting;
using Camelonta.CMS.Web.BaseControls;

namespace HelloWorld.Controls
{
    public partial class DocumentList : BaseUserControl
    {
        public string Header { get; set; }

        /// <summary>
        /// Name of folder currently viewed in list
        /// </summary>
        private string _ListFolder;
        public string ListFolder
        {
            get { return _ListFolder; }
            set { _ListFolder = value; }
        }

        public bool SmallSize { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            // Hide LastModified if we want a smaller list
            if (SmallSize)
                gvFileList.Columns[1].Visible = false;

            if (!string.IsNullOrEmpty(_ListFolder))
            {
                gvFileList.DataSource = CMS.GetFiles(_ListFolder).ToList();
                gvFileList.DataBind();
            }
        }

        protected void gvFileList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFileList.PageIndex = e.NewPageIndex;
            gvFileList.DataBind();
        }


        protected void gvFileList_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<LibraryFile> fileList = (List<LibraryFile>)gvFileList.DataSource;

            // Sort by
            if (e.SortExpression == "Name")
            {
                fileList = fileList.OrderBy(f => f.Name).ToList();
            }
            else if (e.SortExpression== "LastModified")
            {
                fileList = fileList.OrderBy(f => f.MetaProperties.LastModified).ToList();
            }

            gvFileList.DataSource = fileList;
            gvFileList.DataBind();
        }

        public string GetFileIcon(object oFilename)
        {
            string filename = (string)oFilename;
            if (filename.Contains("."))
            {
                string extension = filename.Substring(filename.LastIndexOf(".") + 1);

                if (extension == "jpg") return "../fileicons/file-jpg.gif";
                if (extension == "png") return "../fileicons/file-png.gif";
                if (extension == "gif") return "../fileicons/file-gif.gif";
                if (extension == "doc" || extension == "docx") return "../fileicons/file-doc.gif";
                if (extension == "xls" || extension == "xlsx") return "../fileicons/file-xls.gif";
                if (extension == "pdf") return "../fileicons/file-pdf.gif";
                if (extension == "js") return "../fileicons/file-js.gif";
                if (extension == "css") return "../fileicons/text.gif";
                if (extension == "txt") return "../fileicons/text.gif";
                if (extension == "txt") return "../fileicons/text.gif";
            }
            return "../fileicons/generic.gif";
        }
    }
}