namespace SalaryManager
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dsauve_w17DataSet = new SalaryManager.dsauve_w17DataSet();
            this.playersBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.playersTableAdapter = new SalaryManager.dsauve_w17DataSetTableAdapters.PlayersTableAdapter();
            this.playerIDpkDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameLastDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameFirstDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.playerIDpkDataGridViewTextBoxColumn,
            this.nameLastDataGridViewTextBoxColumn,
            this.nameFirstDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.playersBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(12, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(433, 167);
            this.dataGridView1.TabIndex = 0;
            // 
            // dsauve_w17DataSet
            // 
            this.dsauve_w17DataSet.DataSetName = "dsauve_w17DataSet";
            this.dsauve_w17DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // playersBindingSource
            // 
            this.playersBindingSource.DataMember = "Players";
            this.playersBindingSource.DataSource = this.dsauve_w17DataSet;
            // 
            // playersTableAdapter
            // 
            this.playersTableAdapter.ClearBeforeFill = true;
            // 
            // playerIDpkDataGridViewTextBoxColumn
            // 
            this.playerIDpkDataGridViewTextBoxColumn.DataPropertyName = "playerIDpk";
            this.playerIDpkDataGridViewTextBoxColumn.HeaderText = "PlayerID";
            this.playerIDpkDataGridViewTextBoxColumn.Name = "playerIDpkDataGridViewTextBoxColumn";
            this.playerIDpkDataGridViewTextBoxColumn.ReadOnly = true;
            this.playerIDpkDataGridViewTextBoxColumn.Width = 125;
            // 
            // nameLastDataGridViewTextBoxColumn
            // 
            this.nameLastDataGridViewTextBoxColumn.DataPropertyName = "nameLast";
            this.nameLastDataGridViewTextBoxColumn.HeaderText = "Last";
            this.nameLastDataGridViewTextBoxColumn.Name = "nameLastDataGridViewTextBoxColumn";
            this.nameLastDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameLastDataGridViewTextBoxColumn.Width = 125;
            // 
            // nameFirstDataGridViewTextBoxColumn
            // 
            this.nameFirstDataGridViewTextBoxColumn.DataPropertyName = "nameFirst";
            this.nameFirstDataGridViewTextBoxColumn.HeaderText = "First";
            this.nameFirstDataGridViewTextBoxColumn.Name = "nameFirstDataGridViewTextBoxColumn";
            this.nameFirstDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameFirstDataGridViewTextBoxColumn.Width = 125;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1188, 386);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private dsauve_w17DataSet dsauve_w17DataSet;
        private System.Windows.Forms.BindingSource playersBindingSource;
        private dsauve_w17DataSetTableAdapters.PlayersTableAdapter playersTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn playerIDpkDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameLastDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameFirstDataGridViewTextBoxColumn;
    }
}

