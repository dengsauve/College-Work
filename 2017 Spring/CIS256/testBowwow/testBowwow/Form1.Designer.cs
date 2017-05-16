namespace testBowwow
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
            this.lblDogName = new System.Windows.Forms.Label();
            this.lblBreed = new System.Windows.Forms.Label();
            this.lblAge = new System.Windows.Forms.Label();
            this.lblDogAgeDays = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblDogName
            // 
            this.lblDogName.AutoSize = true;
            this.lblDogName.Location = new System.Drawing.Point(110, 65);
            this.lblDogName.Name = "lblDogName";
            this.lblDogName.Size = new System.Drawing.Size(65, 13);
            this.lblDogName.TabIndex = 0;
            this.lblDogName.Text = "lblDogName";
            // 
            // lblBreed
            // 
            this.lblBreed.AutoSize = true;
            this.lblBreed.Location = new System.Drawing.Point(110, 78);
            this.lblBreed.Name = "lblBreed";
            this.lblBreed.Size = new System.Drawing.Size(35, 13);
            this.lblBreed.TabIndex = 1;
            this.lblBreed.Text = "label1";
            // 
            // lblAge
            // 
            this.lblAge.AutoSize = true;
            this.lblAge.Location = new System.Drawing.Point(110, 91);
            this.lblAge.Name = "lblAge";
            this.lblAge.Size = new System.Drawing.Size(35, 13);
            this.lblAge.TabIndex = 2;
            this.lblAge.Text = "label2";
            // 
            // lblDogAgeDays
            // 
            this.lblDogAgeDays.AutoSize = true;
            this.lblDogAgeDays.Location = new System.Drawing.Point(110, 104);
            this.lblDogAgeDays.Name = "lblDogAgeDays";
            this.lblDogAgeDays.Size = new System.Drawing.Size(35, 13);
            this.lblDogAgeDays.TabIndex = 3;
            this.lblDogAgeDays.Text = "label2";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.lblDogAgeDays);
            this.Controls.Add(this.lblAge);
            this.Controls.Add(this.lblBreed);
            this.Controls.Add(this.lblDogName);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblDogName;
        private System.Windows.Forms.Label lblBreed;
        private System.Windows.Forms.Label lblAge;
        private System.Windows.Forms.Label lblDogAgeDays;
    }
}

