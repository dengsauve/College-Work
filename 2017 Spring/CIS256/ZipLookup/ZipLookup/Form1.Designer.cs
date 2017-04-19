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
            this.dsauve_w17DataSet1 = new ZipLookup.dsauve_w17DataSet1();
            this.tblZipcodesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tblZipcodesTableAdapter = new ZipLookup.dsauve_w17DataSet1TableAdapters.tblZipcodesTableAdapter();
            this.tableAdapterManager = new ZipLookup.dsauve_w17DataSet1TableAdapters.TableAdapterManager();
            this.lblCity = new System.Windows.Forms.Label();
            this.txtState = new System.Windows.Forms.Label();
            this.lblZip = new System.Windows.Forms.Label();
            this.txtZip = new System.Windows.Forms.TextBox();
            this.btnZip = new System.Windows.Forms.Button();
            this.lblCityDyn = new System.Windows.Forms.Label();
            this.lblStateDyn = new System.Windows.Forms.Label();
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
            // lblCity
            // 
            this.lblCity.AutoSize = true;
            this.lblCity.Location = new System.Drawing.Point(23, 23);
            this.lblCity.Name = "lblCity";
            this.lblCity.Size = new System.Drawing.Size(24, 13);
            this.lblCity.TabIndex = 0;
            this.lblCity.Text = "City";
            // 
            // txtState
            // 
            this.txtState.AutoSize = true;
            this.txtState.Location = new System.Drawing.Point(23, 63);
            this.txtState.Name = "txtState";
            this.txtState.Size = new System.Drawing.Size(32, 13);
            this.txtState.TabIndex = 1;
            this.txtState.Text = "State";
            // 
            // lblZip
            // 
            this.lblZip.AutoSize = true;
            this.lblZip.Location = new System.Drawing.Point(23, 110);
            this.lblZip.Name = "lblZip";
            this.lblZip.Size = new System.Drawing.Size(47, 13);
            this.lblZip.TabIndex = 2;
            this.lblZip.Text = "ZipCode";
            // 
            // txtZip
            // 
            this.txtZip.Location = new System.Drawing.Point(150, 107);
            this.txtZip.Name = "txtZip";
            this.txtZip.Size = new System.Drawing.Size(100, 20);
            this.txtZip.TabIndex = 3;
            // 
            // btnZip
            // 
            this.btnZip.Location = new System.Drawing.Point(150, 133);
            this.btnZip.Name = "btnZip";
            this.btnZip.Size = new System.Drawing.Size(100, 23);
            this.btnZip.TabIndex = 4;
            this.btnZip.Text = "Check Zip";
            this.btnZip.UseVisualStyleBackColor = true;
            // 
            // lblCityDyn
            // 
            this.lblCityDyn.Location = new System.Drawing.Point(150, 22);
            this.lblCityDyn.Name = "lblCityDyn";
            this.lblCityDyn.Size = new System.Drawing.Size(100, 23);
            this.lblCityDyn.TabIndex = 5;
            this.lblCityDyn.Click += new System.EventHandler(this.label1_Click);
            // 
            // lblStateDyn
            // 
            this.lblStateDyn.Location = new System.Drawing.Point(150, 63);
            this.lblStateDyn.Name = "lblStateDyn";
            this.lblStateDyn.Size = new System.Drawing.Size(100, 23);
            this.lblStateDyn.TabIndex = 6;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(310, 176);
            this.Controls.Add(this.lblStateDyn);
            this.Controls.Add(this.lblCityDyn);
            this.Controls.Add(this.btnZip);
            this.Controls.Add(this.txtZip);
            this.Controls.Add(this.lblZip);
            this.Controls.Add(this.txtState);
            this.Controls.Add(this.lblCity);
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
        private System.Windows.Forms.Label lblCity;
        private System.Windows.Forms.Label txtState;
        private System.Windows.Forms.Label lblZip;
        private System.Windows.Forms.TextBox txtZip;
        private System.Windows.Forms.Button btnZip;
        private System.Windows.Forms.Label lblCityDyn;
        private System.Windows.Forms.Label lblStateDyn;
    }
}

