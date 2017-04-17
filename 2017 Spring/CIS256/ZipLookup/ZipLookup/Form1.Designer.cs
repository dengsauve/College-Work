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
            this.lblCity = new System.Windows.Forms.Label();
            this.lblState = new System.Windows.Forms.Label();
            this.txtZip = new System.Windows.Forms.TextBox();
            this.btnLookup = new System.Windows.Forms.Button();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.dsauve_w17DataSet = new ZipLookup.dsauve_w17DataSet();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // lblCity
            // 
            this.lblCity.Location = new System.Drawing.Point(12, 9);
            this.lblCity.Name = "lblCity";
            this.lblCity.Size = new System.Drawing.Size(155, 13);
            this.lblCity.TabIndex = 0;
            this.lblCity.Text = "City";
            this.lblCity.Click += new System.EventHandler(this.lblCity_Click);
            // 
            // lblState
            // 
            this.lblState.Location = new System.Drawing.Point(12, 40);
            this.lblState.Name = "lblState";
            this.lblState.Size = new System.Drawing.Size(88, 13);
            this.lblState.TabIndex = 2;
            this.lblState.Text = "State";
            // 
            // txtZip
            // 
            this.txtZip.Location = new System.Drawing.Point(106, 37);
            this.txtZip.Name = "txtZip";
            this.txtZip.Size = new System.Drawing.Size(75, 20);
            this.txtZip.TabIndex = 3;
            // 
            // btnLookup
            // 
            this.btnLookup.Location = new System.Drawing.Point(106, 63);
            this.btnLookup.Name = "btnLookup";
            this.btnLookup.Size = new System.Drawing.Size(75, 23);
            this.btnLookup.TabIndex = 4;
            this.btnLookup.Text = "Test Zip";
            this.btnLookup.UseVisualStyleBackColor = true;
            this.btnLookup.Click += new System.EventHandler(this.btnLookup_Click);
            // 
            // bindingSource1
            // 
            this.bindingSource1.DataSource = this.dsauve_w17DataSet;
            this.bindingSource1.Position = 0;
            // 
            // dsauve_w17DataSet
            // 
            this.dsauve_w17DataSet.DataSetName = "dsauve_w17DataSet";
            this.dsauve_w17DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(202, 98);
            this.Controls.Add(this.btnLookup);
            this.Controls.Add(this.txtZip);
            this.Controls.Add(this.lblState);
            this.Controls.Add(this.lblCity);
            this.Name = "Form1";
            this.Text = "Zip Lookup";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblCity;
        private System.Windows.Forms.Label lblState;
        private System.Windows.Forms.TextBox txtZip;
        private System.Windows.Forms.Button btnLookup;
        private System.Windows.Forms.BindingSource bindingSource1;
        private dsauve_w17DataSet dsauve_w17DataSet;
    }
}

