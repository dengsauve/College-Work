namespace testMovieObj
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
            this.lblNumTickets = new System.Windows.Forms.Label();
            this.lblTheater = new System.Windows.Forms.Label();
            this.lblIsStudent = new System.Windows.Forms.Label();
            this.lblCost = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.lblHlpTickets = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.lblHlpTheater = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.lblHlpCost = new System.Windows.Forms.Label();
            this.lblHlpStudent = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label7 = new System.Windows.Forms.Label();
            this.lblMthGetCost = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblNumTickets
            // 
            this.lblNumTickets.AutoSize = true;
            this.lblNumTickets.Location = new System.Drawing.Point(106, 16);
            this.lblNumTickets.Name = "lblNumTickets";
            this.lblNumTickets.Size = new System.Drawing.Size(35, 13);
            this.lblNumTickets.TabIndex = 0;
            this.lblNumTickets.Text = "label1";
            // 
            // lblTheater
            // 
            this.lblTheater.AutoSize = true;
            this.lblTheater.Location = new System.Drawing.Point(106, 29);
            this.lblTheater.Name = "lblTheater";
            this.lblTheater.Size = new System.Drawing.Size(35, 13);
            this.lblTheater.TabIndex = 1;
            this.lblTheater.Text = "label2";
            // 
            // lblIsStudent
            // 
            this.lblIsStudent.AutoSize = true;
            this.lblIsStudent.Location = new System.Drawing.Point(106, 42);
            this.lblIsStudent.Name = "lblIsStudent";
            this.lblIsStudent.Size = new System.Drawing.Size(35, 13);
            this.lblIsStudent.TabIndex = 3;
            this.lblIsStudent.Text = "label3";
            // 
            // lblCost
            // 
            this.lblCost.AutoSize = true;
            this.lblCost.Location = new System.Drawing.Point(106, 55);
            this.lblCost.Name = "lblCost";
            this.lblCost.Size = new System.Drawing.Size(35, 13);
            this.lblCost.TabIndex = 2;
            this.lblCost.Text = "label4";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "NumberTickets";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 29);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Theater";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 42);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "isStudent";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 55);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Total Cost";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.lblNumTickets);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.lblTheater);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.lblCost);
            this.groupBox1.Controls.Add(this.lblIsStudent);
            this.groupBox1.Location = new System.Drawing.Point(26, 33);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(278, 93);
            this.groupBox1.TabIndex = 8;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "With Constructor";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.lblHlpTickets);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.lblHlpTheater);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.lblHlpCost);
            this.groupBox2.Controls.Add(this.lblHlpStudent);
            this.groupBox2.Location = new System.Drawing.Point(26, 150);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(278, 93);
            this.groupBox2.TabIndex = 9;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Without Constructor (helpers)";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 16);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(79, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "NumberTickets";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(6, 55);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(55, 13);
            this.label6.TabIndex = 7;
            this.label6.Text = "Total Cost";
            // 
            // lblHlpTickets
            // 
            this.lblHlpTickets.AutoSize = true;
            this.lblHlpTickets.Location = new System.Drawing.Point(106, 16);
            this.lblHlpTickets.Name = "lblHlpTickets";
            this.lblHlpTickets.Size = new System.Drawing.Size(35, 13);
            this.lblHlpTickets.TabIndex = 0;
            this.lblHlpTickets.Text = "label1";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(6, 42);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(51, 13);
            this.label8.TabIndex = 6;
            this.label8.Text = "isStudent";
            // 
            // lblHlpTheater
            // 
            this.lblHlpTheater.AutoSize = true;
            this.lblHlpTheater.Location = new System.Drawing.Point(106, 29);
            this.lblHlpTheater.Name = "lblHlpTheater";
            this.lblHlpTheater.Size = new System.Drawing.Size(35, 13);
            this.lblHlpTheater.TabIndex = 1;
            this.lblHlpTheater.Text = "label2";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(6, 29);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(44, 13);
            this.label10.TabIndex = 5;
            this.label10.Text = "Theater";
            // 
            // lblHlpCost
            // 
            this.lblHlpCost.AutoSize = true;
            this.lblHlpCost.Location = new System.Drawing.Point(106, 55);
            this.lblHlpCost.Name = "lblHlpCost";
            this.lblHlpCost.Size = new System.Drawing.Size(35, 13);
            this.lblHlpCost.TabIndex = 2;
            this.lblHlpCost.Text = "label4";
            // 
            // lblHlpStudent
            // 
            this.lblHlpStudent.AutoSize = true;
            this.lblHlpStudent.Location = new System.Drawing.Point(106, 42);
            this.lblHlpStudent.Name = "lblHlpStudent";
            this.lblHlpStudent.Size = new System.Drawing.Size(35, 13);
            this.lblHlpStudent.TabIndex = 3;
            this.lblHlpStudent.Text = "label3";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.lblMthGetCost);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Location = new System.Drawing.Point(26, 271);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(278, 100);
            this.groupBox3.TabIndex = 10;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "GetCost Method Only";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(6, 16);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(55, 13);
            this.label7.TabIndex = 8;
            this.label7.Text = "Total Cost";
            // 
            // lblMthGetCost
            // 
            this.lblMthGetCost.AutoSize = true;
            this.lblMthGetCost.Location = new System.Drawing.Point(106, 16);
            this.lblMthGetCost.Name = "lblMthGetCost";
            this.lblMthGetCost.Size = new System.Drawing.Size(35, 13);
            this.lblMthGetCost.TabIndex = 9;
            this.lblMthGetCost.Text = "label1";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(333, 397);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label lblNumTickets;
        private System.Windows.Forms.Label lblTheater;
        private System.Windows.Forms.Label lblIsStudent;
        private System.Windows.Forms.Label lblCost;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label lblHlpTickets;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label lblHlpTheater;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label lblHlpCost;
        private System.Windows.Forms.Label lblHlpStudent;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label lblMthGetCost;
        private System.Windows.Forms.Label label7;
    }
}

