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
            System.Windows.Forms.Label yearIDLabel;
            System.Windows.Forms.Label teamIDLabel;
            System.Windows.Forms.Label salaryLabel;
            System.Windows.Forms.Label nameLastLabel;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.playerIDpkDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameLastDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameFirstDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.playersBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dsauve_w17DataSet = new SalaryManager.dsauve_w17DataSet();
            this.playersTableAdapter = new SalaryManager.dsauve_w17DataSetTableAdapters.PlayersTableAdapter();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.salaryTextBox = new System.Windows.Forms.TextBox();
            this.salariesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.teamIDTextBox = new System.Windows.Forms.TextBox();
            this.yearIDTextBox = new System.Windows.Forms.TextBox();
            this.bindingNavigator2 = new System.Windows.Forms.BindingNavigator(this.components);
            this.bindingNavigatorAddNewItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorCountItem1 = new System.Windows.Forms.ToolStripLabel();
            this.bindingNavigatorDeleteItem = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMoveFirstItem1 = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMovePreviousItem1 = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorPositionItem1 = new System.Windows.Forms.ToolStripTextBox();
            this.bindingNavigatorSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.bindingNavigatorMoveNextItem1 = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorMoveLastItem1 = new System.Windows.Forms.ToolStripButton();
            this.bindingNavigatorSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.salariesDataGridView = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.salariesTableAdapter = new SalaryManager.dsauve_w17DataSetTableAdapters.SalariesTableAdapter();
            this.tableAdapterManager = new SalaryManager.dsauve_w17DataSetTableAdapters.TableAdapterManager();
            this.nameLastTextBox = new System.Windows.Forms.TextBox();
            this.playersSalariesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.btnFirstRecord = new System.Windows.Forms.Button();
            this.btnPreviousRecord = new System.Windows.Forms.Button();
            this.btnNextRecord = new System.Windows.Forms.Button();
            this.btnLastRecord = new System.Windows.Forms.Button();
            this.lblRecordNumber = new System.Windows.Forms.Label();
            this.lblOf = new System.Windows.Forms.Label();
            this.lblRecordTotal = new System.Windows.Forms.Label();
            yearIDLabel = new System.Windows.Forms.Label();
            teamIDLabel = new System.Windows.Forms.Label();
            salaryLabel = new System.Windows.Forms.Label();
            nameLastLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.salariesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingNavigator2)).BeginInit();
            this.bindingNavigator2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.salariesDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersSalariesBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // yearIDLabel
            // 
            yearIDLabel.AutoSize = true;
            yearIDLabel.Location = new System.Drawing.Point(20, 140);
            yearIDLabel.Name = "yearIDLabel";
            yearIDLabel.Size = new System.Drawing.Size(44, 13);
            yearIDLabel.TabIndex = 2;
            yearIDLabel.Text = "year ID:";
            // 
            // teamIDLabel
            // 
            teamIDLabel.AutoSize = true;
            teamIDLabel.Location = new System.Drawing.Point(17, 166);
            teamIDLabel.Name = "teamIDLabel";
            teamIDLabel.Size = new System.Drawing.Size(47, 13);
            teamIDLabel.TabIndex = 4;
            teamIDLabel.Text = "team ID:";
            // 
            // salaryLabel
            // 
            salaryLabel.AutoSize = true;
            salaryLabel.Location = new System.Drawing.Point(27, 192);
            salaryLabel.Name = "salaryLabel";
            salaryLabel.Size = new System.Drawing.Size(37, 13);
            salaryLabel.TabIndex = 6;
            salaryLabel.Text = "salary:";
            // 
            // nameLastLabel
            // 
            nameLastLabel.AutoSize = true;
            nameLastLabel.Location = new System.Drawing.Point(12, 276);
            nameLastLabel.Name = "nameLastLabel";
            nameLastLabel.Size = new System.Drawing.Size(98, 13);
            nameLastLabel.TabIndex = 3;
            nameLastLabel.Text = "Last Name Search:";
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
            this.dataGridView1.Location = new System.Drawing.Point(12, 41);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(459, 222);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellEnter);
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
            // playersBindingSource
            // 
            this.playersBindingSource.DataMember = "Players";
            this.playersBindingSource.DataSource = this.dsauve_w17DataSet;
            this.playersBindingSource.PositionChanged += new System.EventHandler(this.playersBindingSource_PositionChanged);
            // 
            // dsauve_w17DataSet
            // 
            this.dsauve_w17DataSet.DataSetName = "dsauve_w17DataSet";
            this.dsauve_w17DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // playersTableAdapter
            // 
            this.playersTableAdapter.ClearBeforeFill = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.pictureBox1);
            this.groupBox1.Controls.Add(salaryLabel);
            this.groupBox1.Controls.Add(this.salaryTextBox);
            this.groupBox1.Controls.Add(teamIDLabel);
            this.groupBox1.Controls.Add(this.teamIDTextBox);
            this.groupBox1.Controls.Add(yearIDLabel);
            this.groupBox1.Controls.Add(this.yearIDTextBox);
            this.groupBox1.Controls.Add(this.bindingNavigator2);
            this.groupBox1.Controls.Add(this.salariesDataGridView);
            this.groupBox1.Location = new System.Drawing.Point(489, 41);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(377, 222);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Salary History";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::SalaryManager.Properties.Resources.BaseballPlayer;
            this.pictureBox1.Location = new System.Drawing.Point(280, 137);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(77, 72);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 8;
            this.pictureBox1.TabStop = false;
            // 
            // salaryTextBox
            // 
            this.salaryTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.salariesBindingSource, "salary", true));
            this.salaryTextBox.Location = new System.Drawing.Point(70, 189);
            this.salaryTextBox.Name = "salaryTextBox";
            this.salaryTextBox.Size = new System.Drawing.Size(100, 20);
            this.salaryTextBox.TabIndex = 7;
            this.salaryTextBox.Leave += new System.EventHandler(this.salaryTextBox_Leave);
            // 
            // salariesBindingSource
            // 
            this.salariesBindingSource.DataMember = "Players_Salaries";
            this.salariesBindingSource.DataSource = this.playersBindingSource;
            // 
            // teamIDTextBox
            // 
            this.teamIDTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.salariesBindingSource, "teamID", true));
            this.teamIDTextBox.Location = new System.Drawing.Point(70, 163);
            this.teamIDTextBox.Name = "teamIDTextBox";
            this.teamIDTextBox.Size = new System.Drawing.Size(100, 20);
            this.teamIDTextBox.TabIndex = 5;
            // 
            // yearIDTextBox
            // 
            this.yearIDTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.salariesBindingSource, "yearID", true));
            this.yearIDTextBox.Location = new System.Drawing.Point(70, 137);
            this.yearIDTextBox.Name = "yearIDTextBox";
            this.yearIDTextBox.Size = new System.Drawing.Size(100, 20);
            this.yearIDTextBox.TabIndex = 3;
            this.yearIDTextBox.Leave += new System.EventHandler(this.yearIDTextBox_Leave);
            // 
            // bindingNavigator2
            // 
            this.bindingNavigator2.AddNewItem = this.bindingNavigatorAddNewItem;
            this.bindingNavigator2.BindingSource = this.salariesBindingSource;
            this.bindingNavigator2.CountItem = this.bindingNavigatorCountItem1;
            this.bindingNavigator2.DeleteItem = this.bindingNavigatorDeleteItem;
            this.bindingNavigator2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bindingNavigatorMoveFirstItem1,
            this.bindingNavigatorMovePreviousItem1,
            this.bindingNavigatorSeparator2,
            this.bindingNavigatorPositionItem1,
            this.bindingNavigatorCountItem1,
            this.bindingNavigatorSeparator3,
            this.bindingNavigatorMoveNextItem1,
            this.bindingNavigatorMoveLastItem1,
            this.bindingNavigatorSeparator4,
            this.bindingNavigatorAddNewItem,
            this.bindingNavigatorDeleteItem});
            this.bindingNavigator2.Location = new System.Drawing.Point(3, 16);
            this.bindingNavigator2.MoveFirstItem = this.bindingNavigatorMoveFirstItem1;
            this.bindingNavigator2.MoveLastItem = this.bindingNavigatorMoveLastItem1;
            this.bindingNavigator2.MoveNextItem = this.bindingNavigatorMoveNextItem1;
            this.bindingNavigator2.MovePreviousItem = this.bindingNavigatorMovePreviousItem1;
            this.bindingNavigator2.Name = "bindingNavigator2";
            this.bindingNavigator2.PositionItem = this.bindingNavigatorPositionItem1;
            this.bindingNavigator2.Size = new System.Drawing.Size(371, 25);
            this.bindingNavigator2.TabIndex = 1;
            this.bindingNavigator2.Text = "bindingNavigator2";
            // 
            // bindingNavigatorAddNewItem
            // 
            this.bindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorAddNewItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorAddNewItem.Image")));
            this.bindingNavigatorAddNewItem.Name = "bindingNavigatorAddNewItem";
            this.bindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorAddNewItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorAddNewItem.Text = "Add new";
            // 
            // bindingNavigatorCountItem1
            // 
            this.bindingNavigatorCountItem1.Name = "bindingNavigatorCountItem1";
            this.bindingNavigatorCountItem1.Size = new System.Drawing.Size(35, 22);
            this.bindingNavigatorCountItem1.Text = "of {0}";
            this.bindingNavigatorCountItem1.ToolTipText = "Total number of items";
            // 
            // bindingNavigatorDeleteItem
            // 
            this.bindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorDeleteItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorDeleteItem.Image")));
            this.bindingNavigatorDeleteItem.Name = "bindingNavigatorDeleteItem";
            this.bindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorDeleteItem.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorDeleteItem.Text = "Delete";
            // 
            // bindingNavigatorMoveFirstItem1
            // 
            this.bindingNavigatorMoveFirstItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveFirstItem1.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveFirstItem1.Image")));
            this.bindingNavigatorMoveFirstItem1.Name = "bindingNavigatorMoveFirstItem1";
            this.bindingNavigatorMoveFirstItem1.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveFirstItem1.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveFirstItem1.Text = "Move first";
            // 
            // bindingNavigatorMovePreviousItem1
            // 
            this.bindingNavigatorMovePreviousItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMovePreviousItem1.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMovePreviousItem1.Image")));
            this.bindingNavigatorMovePreviousItem1.Name = "bindingNavigatorMovePreviousItem1";
            this.bindingNavigatorMovePreviousItem1.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMovePreviousItem1.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMovePreviousItem1.Text = "Move previous";
            // 
            // bindingNavigatorSeparator2
            // 
            this.bindingNavigatorSeparator2.Name = "bindingNavigatorSeparator2";
            this.bindingNavigatorSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // bindingNavigatorPositionItem1
            // 
            this.bindingNavigatorPositionItem1.AccessibleName = "Position";
            this.bindingNavigatorPositionItem1.AutoSize = false;
            this.bindingNavigatorPositionItem1.Name = "bindingNavigatorPositionItem1";
            this.bindingNavigatorPositionItem1.Size = new System.Drawing.Size(50, 23);
            this.bindingNavigatorPositionItem1.Text = "0";
            this.bindingNavigatorPositionItem1.ToolTipText = "Current position";
            // 
            // bindingNavigatorSeparator3
            // 
            this.bindingNavigatorSeparator3.Name = "bindingNavigatorSeparator3";
            this.bindingNavigatorSeparator3.Size = new System.Drawing.Size(6, 25);
            // 
            // bindingNavigatorMoveNextItem1
            // 
            this.bindingNavigatorMoveNextItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveNextItem1.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveNextItem1.Image")));
            this.bindingNavigatorMoveNextItem1.Name = "bindingNavigatorMoveNextItem1";
            this.bindingNavigatorMoveNextItem1.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveNextItem1.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveNextItem1.Text = "Move next";
            // 
            // bindingNavigatorMoveLastItem1
            // 
            this.bindingNavigatorMoveLastItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.bindingNavigatorMoveLastItem1.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveLastItem1.Image")));
            this.bindingNavigatorMoveLastItem1.Name = "bindingNavigatorMoveLastItem1";
            this.bindingNavigatorMoveLastItem1.RightToLeftAutoMirrorImage = true;
            this.bindingNavigatorMoveLastItem1.Size = new System.Drawing.Size(23, 22);
            this.bindingNavigatorMoveLastItem1.Text = "Move last";
            // 
            // bindingNavigatorSeparator4
            // 
            this.bindingNavigatorSeparator4.Name = "bindingNavigatorSeparator4";
            this.bindingNavigatorSeparator4.Size = new System.Drawing.Size(6, 25);
            // 
            // salariesDataGridView
            // 
            this.salariesDataGridView.AutoGenerateColumns = false;
            this.salariesDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.salariesDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewTextBoxColumn4,
            this.dataGridViewTextBoxColumn6});
            this.salariesDataGridView.DataSource = this.salariesBindingSource;
            this.salariesDataGridView.Location = new System.Drawing.Point(6, 44);
            this.salariesDataGridView.Name = "salariesDataGridView";
            this.salariesDataGridView.Size = new System.Drawing.Size(365, 87);
            this.salariesDataGridView.TabIndex = 0;
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.DataPropertyName = "yearID";
            this.dataGridViewTextBoxColumn3.HeaderText = "yearID";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.DataPropertyName = "teamID";
            this.dataGridViewTextBoxColumn4.HeaderText = "teamID";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.DataPropertyName = "salary";
            this.dataGridViewTextBoxColumn6.HeaderText = "salary";
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            // 
            // salariesTableAdapter
            // 
            this.salariesTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.PlayersTableAdapter = null;
            this.tableAdapterManager.SalariesTableAdapter = this.salariesTableAdapter;
            this.tableAdapterManager.UpdateOrder = SalaryManager.dsauve_w17DataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // nameLastTextBox
            // 
            this.nameLastTextBox.Location = new System.Drawing.Point(116, 273);
            this.nameLastTextBox.Name = "nameLastTextBox";
            this.nameLastTextBox.Size = new System.Drawing.Size(355, 20);
            this.nameLastTextBox.TabIndex = 4;
            this.nameLastTextBox.TextChanged += new System.EventHandler(this.nameLastTextBox_TextChanged);
            // 
            // playersSalariesBindingSource
            // 
            this.playersSalariesBindingSource.DataMember = "Players_Salaries";
            this.playersSalariesBindingSource.DataSource = this.playersBindingSource;
            // 
            // btnFirstRecord
            // 
            this.btnFirstRecord.Location = new System.Drawing.Point(12, 12);
            this.btnFirstRecord.Name = "btnFirstRecord";
            this.btnFirstRecord.Size = new System.Drawing.Size(75, 23);
            this.btnFirstRecord.TabIndex = 5;
            this.btnFirstRecord.Text = "First Record";
            this.btnFirstRecord.UseVisualStyleBackColor = true;
            this.btnFirstRecord.Click += new System.EventHandler(this.btnFirstRecord_Click);
            // 
            // btnPreviousRecord
            // 
            this.btnPreviousRecord.Location = new System.Drawing.Point(93, 12);
            this.btnPreviousRecord.Name = "btnPreviousRecord";
            this.btnPreviousRecord.Size = new System.Drawing.Size(75, 23);
            this.btnPreviousRecord.TabIndex = 6;
            this.btnPreviousRecord.Text = "Previous";
            this.btnPreviousRecord.UseVisualStyleBackColor = true;
            this.btnPreviousRecord.Click += new System.EventHandler(this.btnPreviousRecord_Click);
            // 
            // btnNextRecord
            // 
            this.btnNextRecord.Location = new System.Drawing.Point(315, 12);
            this.btnNextRecord.Name = "btnNextRecord";
            this.btnNextRecord.Size = new System.Drawing.Size(75, 23);
            this.btnNextRecord.TabIndex = 8;
            this.btnNextRecord.Text = "Next";
            this.btnNextRecord.UseVisualStyleBackColor = true;
            this.btnNextRecord.Click += new System.EventHandler(this.btnNextRecord_Click);
            // 
            // btnLastRecord
            // 
            this.btnLastRecord.Location = new System.Drawing.Point(396, 12);
            this.btnLastRecord.Name = "btnLastRecord";
            this.btnLastRecord.Size = new System.Drawing.Size(75, 23);
            this.btnLastRecord.TabIndex = 9;
            this.btnLastRecord.Text = "Last Record";
            this.btnLastRecord.UseVisualStyleBackColor = true;
            this.btnLastRecord.Click += new System.EventHandler(this.btnLastRecord_Click);
            // 
            // lblRecordNumber
            // 
            this.lblRecordNumber.Location = new System.Drawing.Point(174, 17);
            this.lblRecordNumber.Name = "lblRecordNumber";
            this.lblRecordNumber.Size = new System.Drawing.Size(58, 18);
            this.lblRecordNumber.TabIndex = 10;
            this.lblRecordNumber.Text = "label1";
            // 
            // lblOf
            // 
            this.lblOf.AutoSize = true;
            this.lblOf.Location = new System.Drawing.Point(238, 17);
            this.lblOf.Name = "lblOf";
            this.lblOf.Size = new System.Drawing.Size(16, 13);
            this.lblOf.TabIndex = 11;
            this.lblOf.Text = "of";
            // 
            // lblRecordTotal
            // 
            this.lblRecordTotal.Location = new System.Drawing.Point(251, 17);
            this.lblRecordTotal.Name = "lblRecordTotal";
            this.lblRecordTotal.Size = new System.Drawing.Size(58, 13);
            this.lblRecordTotal.TabIndex = 12;
            this.lblRecordTotal.Text = "label3";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(880, 303);
            this.Controls.Add(this.lblRecordTotal);
            this.Controls.Add(this.lblOf);
            this.Controls.Add(this.lblRecordNumber);
            this.Controls.Add(this.btnLastRecord);
            this.Controls.Add(this.btnNextRecord);
            this.Controls.Add(this.btnPreviousRecord);
            this.Controls.Add(this.btnFirstRecord);
            this.Controls.Add(nameLastLabel);
            this.Controls.Add(this.nameLastTextBox);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Salary Manager";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsauve_w17DataSet)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.salariesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingNavigator2)).EndInit();
            this.bindingNavigator2.ResumeLayout(false);
            this.bindingNavigator2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.salariesDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersSalariesBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private dsauve_w17DataSet dsauve_w17DataSet;
        private System.Windows.Forms.BindingSource playersBindingSource;
        private dsauve_w17DataSetTableAdapters.PlayersTableAdapter playersTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn playerIDpkDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameLastDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameFirstDataGridViewTextBoxColumn;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.BindingSource salariesBindingSource;
        private dsauve_w17DataSetTableAdapters.SalariesTableAdapter salariesTableAdapter;
        private dsauve_w17DataSetTableAdapters.TableAdapterManager tableAdapterManager;
        private System.Windows.Forms.BindingNavigator bindingNavigator2;
        private System.Windows.Forms.ToolStripButton bindingNavigatorAddNewItem;
        private System.Windows.Forms.ToolStripLabel bindingNavigatorCountItem1;
        private System.Windows.Forms.ToolStripButton bindingNavigatorDeleteItem;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveFirstItem1;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMovePreviousItem1;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator2;
        private System.Windows.Forms.ToolStripTextBox bindingNavigatorPositionItem1;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator3;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveNextItem1;
        private System.Windows.Forms.ToolStripButton bindingNavigatorMoveLastItem1;
        private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator4;
        private System.Windows.Forms.DataGridView salariesDataGridView;
        private System.Windows.Forms.TextBox salaryTextBox;
        private System.Windows.Forms.TextBox teamIDTextBox;
        private System.Windows.Forms.TextBox yearIDTextBox;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox nameLastTextBox;
        private System.Windows.Forms.BindingSource playersSalariesBindingSource;
        private System.Windows.Forms.Button btnFirstRecord;
        private System.Windows.Forms.Button btnPreviousRecord;
        private System.Windows.Forms.Button btnNextRecord;
        private System.Windows.Forms.Button btnLastRecord;
        private System.Windows.Forms.Label lblRecordNumber;
        private System.Windows.Forms.Label lblOf;
        private System.Windows.Forms.Label lblRecordTotal;
    }
}

