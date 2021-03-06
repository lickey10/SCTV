<<<<<<< .mine
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using SCTVObjects;

namespace SCTV
{
    public partial class SourcePathForm : Form
    {
        ArrayList sourcePaths = new ArrayList();
        ArrayList origSourcePaths = new ArrayList();
        string lastBrowseLocation = "";

        public ArrayList SourcePaths
        {
            get
            {
                return sourcePaths;
            }

            set
            {
                sourcePaths = value;
                origSourcePaths = value;

                bindToListView(sourcePaths);
            }
        }

        public SourcePathForm()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            //send back the same set that was sent in
            sourcePaths = origSourcePaths;

            this.Close();
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            if (lastBrowseLocation.LastIndexOf("\\") != lastBrowseLocation.Length - 1)
                lastBrowseLocation += "\\";

            if (lastBrowseLocation.Trim().Length > 0)
                folderBrowserDialog1.SelectedPath = lastBrowseLocation;
            else
                folderBrowserDialog1.SelectedPath = Application.StartupPath + "\\Media\\";

            DialogResult result = folderBrowserDialog1.ShowDialog();

            if (result == DialogResult.OK)
            {
                txtSource.Text = this.folderBrowserDialog1.SelectedPath;
                lastBrowseLocation = this.folderBrowserDialog1.SelectedPath;
            }
        }

        /// <summary>
        /// add source location to listView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtSource.Text.Trim().Length > 0 && !contains(txtSource.Text))// !sourcePaths.Contains(txtSource.Text))
            {
                if (cbMediaTypes.SelectedItem != null && cbMediaTypes.SelectedItem.ToString().Trim().Length > 0)
                {
                    sourcePaths.Add(txtSource.Text + "," + cbMediaTypes.SelectedItem.ToString().Trim());
                    lvLocations.Items.Add(txtSource.Text + "," + cbMediaTypes.SelectedItem.ToString().Trim());
                }
                else
                {
                    sourcePaths.Add(txtSource.Text);
                    lvLocations.Items.Add(txtSource.Text);
                }

                lvLocations.Refresh();

                txtSource.Text = "";
            }
            else
                MessageBox.Show("This location already exists");
        }

        private bool contains(string txtToCheck)
        {
            bool isDuplicate = false;

            foreach(string source in sourcePaths)
            {
                if (source.Contains(","))
                {
                    if (txtToCheck == source.Split(',')[0])
                    {
                        isDuplicate = true;
                        break;
                    }
                }
                else
                    if (source.ToLower().Contains(txtToCheck.ToLower()))
                    {
                        isDuplicate = true;
                        break;
                    }
            }

            return isDuplicate;
        }

        /// <summary>
        /// bind arraylist to listview
        /// </summary>
        /// <param name="dataSource"></param>
        private void bindToListView(ArrayList dataSource)
        {
            try
            {
                foreach (string location in dataSource)
                {
                    string newLocation = location;

                    //if (newLocation.Contains(","))
                    //    newLocation = newLocation.Split(',')[0];

                    lvLocations.Items.Add(newLocation);
                }
            }
            catch (Exception ex)
            {
                Tools.WriteToFile(Tools.errorFile, "bindToListView error: " + ex.Message);
            }
        }

        /// <summary>
        /// Close the form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Remove selected entry from lvLocations
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRemove_Click(object sender, EventArgs e)
        {
            foreach (ListViewItem li in lvLocations.SelectedItems)
            {
                //remove item from arraylist
                sourcePaths.Remove(li.Text);

                //remove item from listview
                lvLocations.Items.Remove(li);
            }
        }
    }
}||||||| .r0
=======
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using SCTVObjects;

namespace SCTV
{
    public partial class SourcePathForm : Form
    {
        ArrayList sourcePaths = new ArrayList();
        ArrayList origSourcePaths = new ArrayList();

        public ArrayList SourcePaths
        {
            get
            {
                return sourcePaths;
            }

            set
            {
                sourcePaths = value;
                origSourcePaths = value;

                bindToListView(sourcePaths);
            }
        }

        public SourcePathForm()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            //send back the same set that was sent in
            sourcePaths = origSourcePaths;

            this.Close();
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            DialogResult result = folderBrowserDialog1.ShowDialog();

            if (result == DialogResult.OK)
                txtSource.Text = this.folderBrowserDialog1.SelectedPath;
        }

        /// <summary>
        /// add source location to listView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtSource.Text.Trim().Length > 0 && !sourcePaths.Contains(txtSource.Text))
            {
                sourcePaths.Add(txtSource.Text);

                lvLocations.Items.Add(txtSource.Text);
                lvLocations.Refresh();

                txtSource.Text = "";
            }
            else
                MessageBox.Show("This location already exists");
        }

        /// <summary>
        /// bind arraylist to listview
        /// </summary>
        /// <param name="dataSource"></param>
        private void bindToListView(ArrayList dataSource)
        {
            try
            {
                foreach (string location in dataSource)
                    lvLocations.Items.Add(location);
            }
            catch (Exception ex)
            {
                Tools.WriteToFile(Tools.errorFile, "bindToListView error: " + ex.Message);
            }
        }

        /// <summary>
        /// Close the form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /// <summary>
        /// Remove selected entry from lvLocations
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRemove_Click(object sender, EventArgs e)
        {
            foreach (ListViewItem li in lvLocations.SelectedItems)
            {
                //remove item from arraylist
                sourcePaths.Remove(li.Text);

                //remove item from listview
                lvLocations.Items.Remove(li);
            }
        }
    }
}>>>>>>> .r5
