namespace MenusAssignmentSauve
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.menuItemFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemExit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemClear = new System.Windows.Forms.ToolStripMenuItem();
            this.menuItemCalculate = new System.Windows.Forms.ToolStripMenuItem();
            this.txtTheater = new System.Windows.Forms.TextBox();
            this.lblTheater = new System.Windows.Forms.Label();
            this.lblTickets = new System.Windows.Forms.Label();
            this.lblStudent = new System.Windows.Forms.Label();
            this.chkIsStudent = new System.Windows.Forms.CheckBox();
            this.btnCalculate = new System.Windows.Forms.Button();
            this.numTickets = new System.Windows.Forms.NumericUpDown();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblGrand = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblCharge = new System.Windows.Forms.Label();
            this.lblStudentDiscount = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblSubTotal = new System.Windows.Forms.Label();
            this.lblLabelTotal = new System.Windows.Forms.Label();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.calculateToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.clearToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripCalculate = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripClear = new System.Windows.Forms.ToolStripButton();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numTickets)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuItemFile,
            this.menuItemEdit,
            this.menuItemCalculate});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(242, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuMain";
            // 
            // menuItemFile
            // 
            this.menuItemFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuItemExit});
            this.menuItemFile.Name = "menuItemFile";
            this.menuItemFile.Size = new System.Drawing.Size(37, 20);
            this.menuItemFile.Text = "&File";
            // 
            // menuItemExit
            // 
            this.menuItemExit.Name = "menuItemExit";
            this.menuItemExit.Size = new System.Drawing.Size(152, 22);
            this.menuItemExit.Text = "&Exit";
            this.menuItemExit.Click += new System.EventHandler(this.menuItemExit_Click);
            // 
            // menuItemEdit
            // 
            this.menuItemEdit.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuItemClear});
            this.menuItemEdit.Name = "menuItemEdit";
            this.menuItemEdit.Size = new System.Drawing.Size(39, 20);
            this.menuItemEdit.Text = "&Edit";
            // 
            // menuItemClear
            // 
            this.menuItemClear.Name = "menuItemClear";
            this.menuItemClear.Size = new System.Drawing.Size(152, 22);
            this.menuItemClear.Text = "Clear";
            this.menuItemClear.Click += new System.EventHandler(this.menuItemClear_Click);
            // 
            // menuItemCalculate
            // 
            this.menuItemCalculate.Name = "menuItemCalculate";
            this.menuItemCalculate.Size = new System.Drawing.Size(68, 20);
            this.menuItemCalculate.Text = "&Calculate";
            this.menuItemCalculate.Click += new System.EventHandler(this.menuItemCalculate_Click);
            // 
            // txtTheater
            // 
            this.txtTheater.Location = new System.Drawing.Point(150, 52);
            this.txtTheater.Name = "txtTheater";
            this.txtTheater.Size = new System.Drawing.Size(74, 20);
            this.txtTheater.TabIndex = 0;
            // 
            // lblTheater
            // 
            this.lblTheater.AutoSize = true;
            this.lblTheater.Location = new System.Drawing.Point(13, 55);
            this.lblTheater.Name = "lblTheater";
            this.lblTheater.Size = new System.Drawing.Size(119, 13);
            this.lblTheater.TabIndex = 4;
            this.lblTheater.Text = "Movie Theater Number:";
            // 
            // lblTickets
            // 
            this.lblTickets.AutoSize = true;
            this.lblTickets.Location = new System.Drawing.Point(13, 81);
            this.lblTickets.Name = "lblTickets";
            this.lblTickets.Size = new System.Drawing.Size(97, 13);
            this.lblTickets.TabIndex = 5;
            this.lblTickets.Text = "Number of Tickets:";
            // 
            // lblStudent
            // 
            this.lblStudent.AutoSize = true;
            this.lblStudent.Location = new System.Drawing.Point(13, 106);
            this.lblStudent.Name = "lblStudent";
            this.lblStudent.Size = new System.Drawing.Size(95, 13);
            this.lblStudent.TabIndex = 6;
            this.lblStudent.Text = "Are you a Student:";
            // 
            // chkIsStudent
            // 
            this.chkIsStudent.AutoSize = true;
            this.chkIsStudent.Location = new System.Drawing.Point(150, 105);
            this.chkIsStudent.Name = "chkIsStudent";
            this.chkIsStudent.Size = new System.Drawing.Size(44, 17);
            this.chkIsStudent.TabIndex = 2;
            this.chkIsStudent.Text = "Yes";
            this.chkIsStudent.UseVisualStyleBackColor = true;
            // 
            // btnCalculate
            // 
            this.btnCalculate.Location = new System.Drawing.Point(150, 129);
            this.btnCalculate.Name = "btnCalculate";
            this.btnCalculate.Size = new System.Drawing.Size(74, 23);
            this.btnCalculate.TabIndex = 3;
            this.btnCalculate.Text = "Calculate";
            this.btnCalculate.UseVisualStyleBackColor = true;
            this.btnCalculate.Click += new System.EventHandler(this.btnCalculate_Click);
            // 
            // numTickets
            // 
            this.numTickets.Location = new System.Drawing.Point(150, 79);
            this.numTickets.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.numTickets.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numTickets.Name = "numTickets";
            this.numTickets.Size = new System.Drawing.Size(74, 20);
            this.numTickets.TabIndex = 1;
            this.numTickets.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lblGrand);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.lblCharge);
            this.groupBox1.Controls.Add(this.lblStudentDiscount);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.lblSubTotal);
            this.groupBox1.Controls.Add(this.lblLabelTotal);
            this.groupBox1.Location = new System.Drawing.Point(16, 158);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(208, 84);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            // 
            // lblGrand
            // 
            this.lblGrand.Location = new System.Drawing.Point(134, 68);
            this.lblGrand.Name = "lblGrand";
            this.lblGrand.Size = new System.Drawing.Size(66, 13);
            this.lblGrand.TabIndex = 17;
            this.lblGrand.Text = "$";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 68);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(66, 13);
            this.label5.TabIndex = 16;
            this.label5.Text = "Grand Total:";
            // 
            // lblCharge
            // 
            this.lblCharge.Location = new System.Drawing.Point(134, 29);
            this.lblCharge.Name = "lblCharge";
            this.lblCharge.Size = new System.Drawing.Size(66, 13);
            this.lblCharge.TabIndex = 15;
            this.lblCharge.Text = "$";
            // 
            // lblStudentDiscount
            // 
            this.lblStudentDiscount.Location = new System.Drawing.Point(134, 42);
            this.lblStudentDiscount.Name = "lblStudentDiscount";
            this.lblStudentDiscount.Size = new System.Drawing.Size(66, 13);
            this.lblStudentDiscount.TabIndex = 14;
            this.lblStudentDiscount.Text = "$";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(92, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "Student Discount:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(84, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "Theater Charge:";
            // 
            // lblSubTotal
            // 
            this.lblSubTotal.Location = new System.Drawing.Point(134, 16);
            this.lblSubTotal.Name = "lblSubTotal";
            this.lblSubTotal.Size = new System.Drawing.Size(66, 13);
            this.lblSubTotal.TabIndex = 11;
            this.lblSubTotal.Text = "$";
            // 
            // lblLabelTotal
            // 
            this.lblLabelTotal.AutoSize = true;
            this.lblLabelTotal.Location = new System.Drawing.Point(6, 16);
            this.lblLabelTotal.Name = "lblLabelTotal";
            this.lblLabelTotal.Size = new System.Drawing.Size(56, 13);
            this.lblLabelTotal.TabIndex = 0;
            this.lblLabelTotal.Text = "Sub Total:";
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.calculateToolStripMenuItem,
            this.clearToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.ShowImageMargin = false;
            this.contextMenuStrip1.Size = new System.Drawing.Size(99, 70);
            // 
            // calculateToolStripMenuItem
            // 
            this.calculateToolStripMenuItem.Name = "calculateToolStripMenuItem";
            this.calculateToolStripMenuItem.Size = new System.Drawing.Size(98, 22);
            this.calculateToolStripMenuItem.Text = "Calculate";
            this.calculateToolStripMenuItem.Click += new System.EventHandler(this.calculateToolStripMenuItem_Click);
            // 
            // clearToolStripMenuItem
            // 
            this.clearToolStripMenuItem.Name = "clearToolStripMenuItem";
            this.clearToolStripMenuItem.Size = new System.Drawing.Size(98, 22);
            this.clearToolStripMenuItem.Text = "Clear";
            this.clearToolStripMenuItem.Click += new System.EventHandler(this.clearToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(98, 22);
            this.exitToolStripMenuItem.Text = "Exit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // toolStrip1
            // 
            this.toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripCalculate,
            this.toolStripSeparator1,
            this.toolStripClear});
            this.toolStrip1.Location = new System.Drawing.Point(0, 24);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.toolStrip1.Size = new System.Drawing.Size(242, 25);
            this.toolStrip1.TabIndex = 11;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripCalculate
            // 
            this.toolStripCalculate.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripCalculate.Image = ((System.Drawing.Image)(resources.GetObject("toolStripCalculate.Image")));
            this.toolStripCalculate.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripCalculate.Name = "toolStripCalculate";
            this.toolStripCalculate.Size = new System.Drawing.Size(60, 22);
            this.toolStripCalculate.Text = "Calculate";
            this.toolStripCalculate.ToolTipText = "Calculate";
            this.toolStripCalculate.Click += new System.EventHandler(this.toolStripCalculate_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripClear
            // 
            this.toolStripClear.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripClear.Image = ((System.Drawing.Image)(resources.GetObject("toolStripClear.Image")));
            this.toolStripClear.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripClear.Name = "toolStripClear";
            this.toolStripClear.Size = new System.Drawing.Size(38, 22);
            this.toolStripClear.Text = "Clear";
            this.toolStripClear.ToolTipText = "Reset All Fields";
            this.toolStripClear.Click += new System.EventHandler(this.toolStripClear_Click);
            // 
            // Form1
            // 
            this.AcceptButton = this.btnCalculate;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(242, 262);
            this.ContextMenuStrip = this.contextMenuStrip1;
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.numTickets);
            this.Controls.Add(this.btnCalculate);
            this.Controls.Add(this.chkIsStudent);
            this.Controls.Add(this.lblStudent);
            this.Controls.Add(this.lblTickets);
            this.Controls.Add(this.lblTheater);
            this.Controls.Add(this.txtTheater);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Form1";
            this.Text = "Movie Tickets";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numTickets)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem menuItemFile;
        private System.Windows.Forms.ToolStripMenuItem menuItemExit;
        private System.Windows.Forms.ToolStripMenuItem menuItemEdit;
        private System.Windows.Forms.ToolStripMenuItem menuItemClear;
        private System.Windows.Forms.ToolStripMenuItem menuItemCalculate;
        private System.Windows.Forms.TextBox txtTheater;
        private System.Windows.Forms.Label lblTheater;
        private System.Windows.Forms.Label lblTickets;
        private System.Windows.Forms.Label lblStudent;
        private System.Windows.Forms.CheckBox chkIsStudent;
        private System.Windows.Forms.Button btnCalculate;
        private System.Windows.Forms.NumericUpDown numTickets;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label lblSubTotal;
        private System.Windows.Forms.Label lblLabelTotal;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem calculateToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem clearToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.Label lblCharge;
        private System.Windows.Forms.Label lblStudentDiscount;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblGrand;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton toolStripCalculate;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton toolStripClear;
    }
}

