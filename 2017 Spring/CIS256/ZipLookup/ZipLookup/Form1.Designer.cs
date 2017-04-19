namespace ZipLookup
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Label zipLabel;
            System.Windows.Forms.Label cityLabel;
            System.Windows.Forms.Label stateLabel;
            this.dsauve_w17DataSet1 = new ZipLookup.dsauve_w17DataSet1();
            this.tblZipcodesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tblZipcodesTableAdapter = new ZipLookup.dsauve_w17DataSet1TableAdapters.tblZipcodesTableAdapter();
            this.tableAdapterManager = new ZipLookup.dsauve_w17DataSet1TableAdapters.TableAdapterManager();
            this.zipTextBox = new System.Windows.Forms.TextBox();
            this.cityTextBox = new System.Windows.Forms.TextBox();
            this.stateTextBox = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            zipLabel = new System.Windows.Forms.Label();
            cityLabel = new System.Windows.Forms.Label();
            stateLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tblZipcodesBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dsauve_w17DataSet1
            // 
            this.dsauve_w17DataSet1.DataSetName = "dsauve_w17DataSet1";
            this.dsauve_w17DataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tblZipcodesBindingSource
            // 
            this.tblZipcodesBindingSource.DataMember = "tblZipcodes";
            this.tblZipcodesBindingSource.DataSource = this.dsauve_w17DataSet1;
            // 
            // tblZipcodesTableAdapter
            // 
            this.tblZipcodesTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.tblZipcodesTableAdapter = this.tblZipcodesTableAdapter;
            this.tableAdapterManager.UpdateOrder = ZipLookup.dsauve_w17DataSet1TableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // zipLabel
            // 
            zipLabel.AutoSize = true;
            zipLabel.Location = new System.Drawing.Point(69, 108);
            zipLabel.Name = "zipLabel";
            zipLabel.Size = new System.Drawing.Size(23, 13);
            zipLabel.TabIndex = 1;
            zipLabel.Text = "zip:";
            // 
            // zipTextBox
            // 
            this.zipTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.tblZipcodesBindingSource, "zip", true));
            this.zipTextBox.Location = new System.Drawing.Point(108, 105);
            this.zipTextBox.Name = "zipTextBox";
            this.zipTextBox.Size = new System.Drawing.Size(100, 20);
            this.zipTextBox.TabIndex = 2;
            this.zipTextBox.TextChanged += new System.EventHandler(this.zipTextBox_TextChanged);
            // 
            // cityLabel
            // 
            cityLabel.AutoSize = true;
            cityLabel.Location = new System.Drawing.Point(69, 56);
            cityLabel.Name = "cityLabel";
            cityLabel.Size = new System.Drawing.Size(26, 13);
            cityLabel.TabIndex = 3;
            cityLabel.Text = "city:";
            // 
            // cityTextBox
            // 
            this.cityTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.tblZipcodesBindingSource, "city", true));
            this.cityTextBox.Location = new System.Drawing.Point(108, 53);
            this.cityTextBox.Name = "cityTextBox";
            this.cityTextBox.Size = new System.Drawing.Size(100, 20);
            this.cityTextBox.TabIndex = 4;
            // 
            // stateLabel
            // 
            stateLabel.AutoSize = true;
            stateLabel.Location = new System.Drawing.Point(69, 82);
            stateLabel.Name = "stateLabel";
            stateLabel.Size = new System.Drawing.Size(33, 13);
            stateLabel.TabIndex = 5;
            stateLabel.Text = "state:";
            // 
            // stateTextBox
            // 
            this.stateTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.tblZipcodesBindingSource, "state", true));
            this.stateTextBox.Location = new System.Drawing.Point(108, 79);
            this.stateTextBox.Name = "stateTextBox";
            this.stateTextBox.Size = new System.Drawing.Size(100, 20);
            this.stateTextBox.TabIndex = 6;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(108, 132);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 7;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(310, 176);
            this.Controls.Add(this.button1);
            this.Controls.Add(zipLabel);
            this.Controls.Add(this.zipTextBox);
            this.Controls.Add(cityLabel);
            this.Controls.Add(this.cityTextBox);
            this.Controls.Add(stateLabel);
            this.Controls.Add(this.stateTextBox);
            this.Name = "Form1";
            this.Text = "Zip Lookup";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tblZipcodesBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private dsauve_w17DataSet dsauve_w17DataSet;
        private dsauve_w17DataSet1 dsauve_w17DataSet1;
        private System.Windows.Forms.BindingSource tblZipcodesBindingSource;
        private dsauve_w17DataSet1TableAdapters.tblZipcodesTableAdapter tblZipcodesTableAdapter;
        private dsauve_w17DataSet1TableAdapters.TableAdapterManager tableAdapterManager;
        private System.Windows.Forms.TextBox zipTextBox;
        private System.Windows.Forms.TextBox cityTextBox;
        private System.Windows.Forms.TextBox stateTextBox;
        private System.Windows.Forms.Button button1;
    }
}

