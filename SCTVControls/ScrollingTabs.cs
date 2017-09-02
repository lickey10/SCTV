using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.Drawing.Drawing2D;
using SCTVObjects;

namespace SCTV.Controls
{
    public partial class ScrollingTabs : UserControl
    {
        public delegate void selectionChanged();
        public event selectionChanged SelectionChanged;

        private ArrayList tabControls;
        private Color tabColor = Color.LightBlue;
        private Color selectedColor = Color.Orange;
        private bool multiSelect = false;
        private int buttonHeight = 0;
        private int buttonWidth = 0;
        private int selectedTabIndexes = 0;
        private int textWidth = 0;

        public ArrayList Tabs
        {
            get 
            {
                return tabControls; 
            }

            set 
            {
                tabControls = value;

                updateControls();
            }
        }

        public string SelectedTabs
        {
            get
            {
                string selectedTypes = "";

                foreach (Button button in flowLayoutPanel.Controls)
                {
                    if (button.Tag != null && (bool)button.Tag)
                    {
                        if (selectedTypes.Length > 0)
                            selectedTypes += "|";

                        selectedTypes += button.Text;
                    }
                }

                return selectedTypes;
            }

            set
            {
                foreach (string tabName in value.Split('|'))
                {
                    if (tabName.Length > 0)
                    {
                        foreach (Button button in flowLayoutPanel.Controls)
                        {
                            if (button.Text.ToLower() == tabName.ToLower())
                                button.Tag = true;
                            else
                                button.Tag = false;
                        }
                    }
                }

                flowLayoutPanel.Invalidate(true);
            }
        }

        public int ButtonWidth
        {
            set { buttonWidth = value; }
        }

        public int ButtonHeight
        {
            set { buttonHeight = value; }
        }

        public bool MultiSelect
        {
            get { return multiSelect; }
            set { multiSelect = value; }
        }

        public string SelectedTabIndexes
        {
            set 
            {
                int controlIndex = 0;
                int result = 0;

                foreach (string tabIndex in value.Split('|'))
                {
                    if (int.TryParse(tabIndex, out result))
                    {
                        foreach (Button button in flowLayoutPanel.Controls)
                        {
                            if (controlIndex == result)
                                button.Tag = true;
                            else
                                button.Tag = false;

                            controlIndex++;
                        }
                    }
                }

                flowLayoutPanel.Invalidate(true);
            }

            get 
            {
                string selectedIndexes = "";
                int controlIndex = 0;

                foreach (Button button in flowLayoutPanel.Controls)
                {
                    if (button.Tag != null && (bool)button.Tag)
                    {
                        if (selectedIndexes.Length > 0)
                            selectedIndexes += "|";

                        selectedIndexes += controlIndex.ToString();
                    }
                }

                return selectedIndexes;
            }
        }

        public Color TabColor
        {
            get { return tabColor; }
            set { tabColor = value; }
        }

        public Color TabColorSelected
        {
            get { return selectedColor; }
            set { selectedColor = value; }
        }

        public ScrollingTabs()
        {
            InitializeComponent();

            flowLayoutPanel.Font = this.Font;
        }

        public ScrollingTabs(ArrayList tabs)
        {
            InitializeComponent();

            tabControls = tabs;

            flowLayoutPanel.Font = this.Font;

            updateControls();
        }

        private void updateControls()
        {
            try
            {
                flowLayoutPanel.Controls.Clear();

                if (tabControls != null)
                {
                    foreach (string tabName in tabControls)
                    {
                        Button button1 = new Button();
                        button1.Name = tabName.Trim();
                        button1.Text = tabName.Trim();
                        button1.FlatStyle = FlatStyle.Flat;
                        button1.Font = this.Font;
                        button1.AutoSize = true;
                        button1.AutoSizeMode = AutoSizeMode.GrowAndShrink;

                        if (buttonHeight == 0)
                            buttonHeight = flowLayoutPanel.Height - flowLayoutPanel.AutoScrollMinSize.Height - 9;

                        button1.Height = buttonHeight;

                        button1.Click += new EventHandler(button1_Click);
                        button1.Paint += new PaintEventHandler(button1_Paint);

                        flowLayoutPanel.Controls.Add(button1);
                    }

                    if (flowLayoutPanel.Controls.Count > 0)
                        ((Button)flowLayoutPanel.Controls[0]).Move += new EventHandler(ScrollingTabs_Move);
                }
            }
            catch (Exception ex)
            {
                Tools.WriteToFile(ex);
            }
        }

        void ScrollingTabs_Move(object sender, EventArgs e)
        {
            this.Invalidate(true);
        }

        void button1_Paint(object sender, PaintEventArgs e)
        {
            try
            {
                if (e.ClipRectangle.Width > 0 && e.ClipRectangle.Height > 0)
                {
                    LinearGradientBrush bgBrush = null;
                    Button selectedButton = (Button)sender;

                    Rectangle rectButtonBkgd = new Rectangle(e.ClipRectangle.X - 10, e.ClipRectangle.Y, e.ClipRectangle.Width + 40, e.ClipRectangle.Height);

                    //set button color
                    if (selectedButton.Tag == null || !(bool)selectedButton.Tag)
                        bgBrush = new LinearGradientBrush(rectButtonBkgd, Color.LightCyan, Color.LightBlue, LinearGradientMode.Horizontal);
                    else
                        bgBrush = new LinearGradientBrush(rectButtonBkgd, Color.LightYellow, Color.PeachPuff, LinearGradientMode.Vertical);

                    if (bgBrush != null)
                        using (bgBrush)
                            e.Graphics.FillRectangle(bgBrush, rectButtonBkgd);
                    
                    //textWidth = (int)(e.Graphics.MeasureString(selectedButton.Text, selectedButton.Font).Width);

                    //selectedButton.Width = textWidth + 6;

                    e.Graphics.DrawString(selectedButton.Text, selectedButton.Font, Brushes.Black, 4, 4);
                }
            }
            catch (Exception ex)
            {
                Tools.WriteToFile(ex);
            }
        }

        void button1_Click(object sender, EventArgs e)
        {
            Button selectedButton = (Button)sender;
            
            //set button tag
            if (selectedButton.Tag == null || !(bool)selectedButton.Tag)
                selectedButton.Tag = true;
            else
                selectedButton.Tag = false;

            if (!multiSelect)
            {
                singleSelect(selectedButton);

                flowLayoutPanel.Invalidate(true);
            }
            else
                selectedButton.Invalidate();

            if(SelectionChanged != null)
                SelectionChanged();
        }

        private void singleSelect(Button selectedButton)
        {
            foreach (Button button in flowLayoutPanel.Controls)
            {
                if (button != selectedButton)
                    button.Tag = false;
            }
        }

        private void flowLayoutPanel_Paint(object sender, PaintEventArgs e)
        {
            try
            {
                if (e.ClipRectangle.Width > 0 && e.ClipRectangle.Height > 0)
                {
                    LinearGradientBrush bgBrush = null;
                    bgBrush = new LinearGradientBrush(e.ClipRectangle, Color.OldLace, Color.LightBlue, LinearGradientMode.Vertical);

                    if (bgBrush != null)
                        using (bgBrush)
                            e.Graphics.FillRectangle(bgBrush, e.ClipRectangle);
                }
            }
            catch (Exception ex)
            {
                Tools.WriteToFile(ex);
            }

        }

        private void ScrollingTabs_FontChanged(object sender, EventArgs e)
        {
            updateControls();
        }
    }
}
