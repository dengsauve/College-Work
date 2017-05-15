namespace MethodsProjectMidterm
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
            this.lblNumber1 = new System.Windows.Forms.Label();
            this.lblNumber2 = new System.Windows.Forms.Label();
            this.lblProduct = new System.Windows.Forms.Label();
            this.txtNum1 = new System.Windows.Forms.TextBox();
            this.TextNum2 = new System.Windows.Forms.TextBox();
            this.btnCalculate = new System.Windows.Forms.Button();
            this.grpProduct = new System.Windows.Forms.GroupBox();
            this.lblZip = new System.Windows.Forms.Label();
            this.txtZip = new System.Windows.Forms.TextBox();
            this.grpLocation = new System.Windows.Forms.GroupBox();
            this.btnGetLocation = new System.Windows.Forms.Button();
            this.lblLocation = new System.Windows.Forms.Label();
            this.btnIsNumeric = new System.Windows.Forms.Button();
            this.txtNumString = new System.Windows.Forms.TextBox();
            this.lblString = new System.Windows.Forms.Label();
            this.grpEvaluation = new System.Windows.Forms.GroupBox();
            this.lblEvaluation = new System.Windows.Forms.Label();
            this.btnIsInteger = new System.Windows.Forms.Button();
            this.grpProduct.SuspendLayout();
            this.grpLocation.SuspendLayout();
            this.grpEvaluation.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblNumber1
            // 
            this.lblNumber1.AutoSize = true;
            this.lblNumber1.Location = new System.Drawing.Point(11, 15);
            this.lblNumber1.Name = "lblNumber1";
            this.lblNumber1.Size = new System.Drawing.Size(53, 13);
            this.lblNumber1.TabIndex = 0;
            this.lblNumber1.Text = "Number 1";
            // 
            // lblNumber2
            // 
            this.lblNumber2.AutoSize = true;
            this.lblNumber2.Location = new System.Drawing.Point(11, 41);
            this.lblNumber2.Name = "lblNumber2";
            this.lblNumber2.Size = new System.Drawing.Size(53, 13);
            this.lblNumber2.TabIndex = 1;
            this.lblNumber2.Text = "Number 2";
            // 
            // lblProduct
            // 
            this.lblProduct.AutoSize = true;
            this.lblProduct.Location = new System.Drawing.Point(6, 16);
            this.lblProduct.Name = "lblProduct";
            this.lblProduct.Size = new System.Drawing.Size(44, 13);
            this.lblProduct.TabIndex = 2;
            this.lblProduct.Text = "Product";
            // 
            // txtNum1
            // 
            this.txtNum1.Location = new System.Drawing.Point(70, 12);
            this.txtNum1.Name = "txtNum1";
            this.txtNum1.Size = new System.Drawing.Size(100, 20);
            this.txtNum1.TabIndex = 3;
            // 
            // TextNum2
            // 
            this.TextNum2.Location = new System.Drawing.Point(70, 38);
            this.TextNum2.Name = "TextNum2";
            this.TextNum2.Size = new System.Drawing.Size(100, 20);
            this.TextNum2.TabIndex = 4;
            // 
            // btnCalculate
            // 
            this.btnCalculate.Location = new System.Drawing.Point(95, 64);
            this.btnCalculate.Name = "btnCalculate";
            this.btnCalculate.Size = new System.Drawing.Size(75, 23);
            this.btnCalculate.TabIndex = 5;
            this.btnCalculate.Text = "Calculate";
            this.btnCalculate.UseVisualStyleBackColor = true;
            this.btnCalculate.Click += new System.EventHandler(this.btnCalculate_Click);
            // 
            // grpProduct
            // 
            this.grpProduct.Controls.Add(this.lblProduct);
            this.grpProduct.Location = new System.Drawing.Point(14, 93);
            this.grpProduct.Name = "grpProduct";
            this.grpProduct.Size = new System.Drawing.Size(156, 41);
            this.grpProduct.TabIndex = 6;
            this.grpProduct.TabStop = false;
            this.grpProduct.Text = "Product";
            // 
            // lblZip
            // 
            this.lblZip.AutoSize = true;
            this.lblZip.Location = new System.Drawing.Point(213, 15);
            this.lblZip.Name = "lblZip";
            this.lblZip.Size = new System.Drawing.Size(50, 13);
            this.lblZip.TabIndex = 7;
            this.lblZip.Text = "Zip Code";
            // 
            // txtZip
            // 
            this.txtZip.Location = new System.Drawing.Point(269, 12);
            this.txtZip.Name = "txtZip";
            this.txtZip.Size = new System.Drawing.Size(100, 20);
            this.txtZip.TabIndex = 8;
            // 
            // grpLocation
            // 
            this.grpLocation.Controls.Add(this.lblLocation);
            this.grpLocation.Location = new System.Drawing.Point(216, 70);
            this.grpLocation.Name = "grpLocation";
            this.grpLocation.Size = new System.Drawing.Size(153, 64);
            this.grpLocation.TabIndex = 9;
            this.grpLocation.TabStop = false;
            this.grpLocation.Text = "Location";
            // 
            // btnGetLocation
            // 
            this.btnGetLocation.Location = new System.Drawing.Point(269, 41);
            this.btnGetLocation.Name = "btnGetLocation";
            this.btnGetLocation.Size = new System.Drawing.Size(100, 23);
            this.btnGetLocation.TabIndex = 10;
            this.btnGetLocation.Text = "Get Location";
            this.btnGetLocation.UseVisualStyleBackColor = true;
            this.btnGetLocation.Click += new System.EventHandler(this.btnGetLocation_Click);
            // 
            // lblLocation
            // 
            this.lblLocation.AutoSize = true;
            this.lblLocation.Location = new System.Drawing.Point(6, 16);
            this.lblLocation.Name = "lblLocation";
            this.lblLocation.Size = new System.Drawing.Size(55, 13);
            this.lblLocation.TabIndex = 0;
            this.lblLocation.Text = "City, State";
            // 
            // btnIsNumeric
            // 
            this.btnIsNumeric.Location = new System.Drawing.Point(448, 41);
            this.btnIsNumeric.Name = "btnIsNumeric";
            this.btnIsNumeric.Size = new System.Drawing.Size(100, 23);
            this.btnIsNumeric.TabIndex = 13;
            this.btnIsNumeric.Text = "Is Numeric?";
            this.btnIsNumeric.UseVisualStyleBackColor = true;
            this.btnIsNumeric.Click += new System.EventHandler(this.btnIsNumeric_Click);
            // 
            // txtNumString
            // 
            this.txtNumString.Location = new System.Drawing.Point(448, 12);
            this.txtNumString.Name = "txtNumString";
            this.txtNumString.Size = new System.Drawing.Size(100, 20);
            this.txtNumString.TabIndex = 12;
            // 
            // lblString
            // 
            this.lblString.AutoSize = true;
            this.lblString.Location = new System.Drawing.Point(408, 15);
            this.lblString.Name = "lblString";
            this.lblString.Size = new System.Drawing.Size(34, 13);
            this.lblString.TabIndex = 11;
            this.lblString.Text = "String";
            // 
            // grpEvaluation
            // 
            this.grpEvaluation.Controls.Add(this.lblEvaluation);
            this.grpEvaluation.Location = new System.Drawing.Point(411, 99);
            this.grpEvaluation.Name = "grpEvaluation";
            this.grpEvaluation.Size = new System.Drawing.Size(137, 35);
            this.grpEvaluation.TabIndex = 14;
            this.grpEvaluation.TabStop = false;
            this.grpEvaluation.Text = "Evaluation";
            // 
            // lblEvaluation
            // 
            this.lblEvaluation.AutoSize = true;
            this.lblEvaluation.Location = new System.Drawing.Point(6, 16);
            this.lblEvaluation.Name = "lblEvaluation";
            this.lblEvaluation.Size = new System.Drawing.Size(57, 13);
            this.lblEvaluation.TabIndex = 0;
            this.lblEvaluation.Text = "Evaluation";
            // 
            // btnIsInteger
            // 
            this.btnIsInteger.Location = new System.Drawing.Point(448, 70);
            this.btnIsInteger.Name = "btnIsInteger";
            this.btnIsInteger.Size = new System.Drawing.Size(100, 23);
            this.btnIsInteger.TabIndex = 15;
            this.btnIsInteger.Text = "Is Integer?";
            this.btnIsInteger.UseVisualStyleBackColor = true;
            this.btnIsInteger.Click += new System.EventHandler(this.btnIsInteger_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(572, 155);
            this.Controls.Add(this.btnIsInteger);
            this.Controls.Add(this.grpEvaluation);
            this.Controls.Add(this.btnIsNumeric);
            this.Controls.Add(this.txtNumString);
            this.Controls.Add(this.lblString);
            this.Controls.Add(this.btnGetLocation);
            this.Controls.Add(this.grpLocation);
            this.Controls.Add(this.txtZip);
            this.Controls.Add(this.lblZip);
            this.Controls.Add(this.grpProduct);
            this.Controls.Add(this.btnCalculate);
            this.Controls.Add(this.TextNum2);
            this.Controls.Add(this.txtNum1);
            this.Controls.Add(this.lblNumber2);
            this.Controls.Add(this.lblNumber1);
            this.Name = "Form1";
            this.Text = "Midterm";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.grpProduct.ResumeLayout(false);
            this.grpProduct.PerformLayout();
            this.grpLocation.ResumeLayout(false);
            this.grpLocation.PerformLayout();
            this.grpEvaluation.ResumeLayout(false);
            this.grpEvaluation.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblNumber1;
        private System.Windows.Forms.Label lblNumber2;
        private System.Windows.Forms.Label lblProduct;
        private System.Windows.Forms.TextBox txtNum1;
        private System.Windows.Forms.TextBox TextNum2;
        private System.Windows.Forms.Button btnCalculate;
        private System.Windows.Forms.GroupBox grpProduct;
        private System.Windows.Forms.Label lblZip;
        private System.Windows.Forms.TextBox txtZip;
        private System.Windows.Forms.GroupBox grpLocation;
        private System.Windows.Forms.Label lblLocation;
        private System.Windows.Forms.Button btnGetLocation;
        private System.Windows.Forms.Button btnIsNumeric;
        private System.Windows.Forms.TextBox txtNumString;
        private System.Windows.Forms.Label lblString;
        private System.Windows.Forms.GroupBox grpEvaluation;
        private System.Windows.Forms.Label lblEvaluation;
        private System.Windows.Forms.Button btnIsInteger;
    }
}

