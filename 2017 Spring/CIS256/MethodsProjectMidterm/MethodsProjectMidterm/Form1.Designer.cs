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
            this.grpProduct.SuspendLayout();
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
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(333, 155);
            this.Controls.Add(this.grpProduct);
            this.Controls.Add(this.btnCalculate);
            this.Controls.Add(this.TextNum2);
            this.Controls.Add(this.txtNum1);
            this.Controls.Add(this.lblNumber2);
            this.Controls.Add(this.lblNumber1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.grpProduct.ResumeLayout(false);
            this.grpProduct.PerformLayout();
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
    }
}

