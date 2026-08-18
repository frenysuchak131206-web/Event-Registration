using System;
using System.Web.UI.WebControls;

namespace WebApplication10
{
    public partial class WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSuccess.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Run all validators
            Page.Validate();

            // Check whether all validation passed
            if (Page.IsValid)
            {
                lblSuccess.Text =
                    "Registration Completed Successfully! " +
                    "Thank you for registering. " +
                    "We’ll contact you with the next steps if required.";

                lblSuccess.Visible = true;
            }
            else
            {
                lblSuccess.Visible = false;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Clear TextBoxes
            txtName.Text = "";
            txtEmail.Text = "";
            txtContact.Text = "";
            txtCollege.Text = "";
            txtAddress.Text = "";

            // Clear Department
            rblDepartment.ClearSelection();

            // Reset Event
            ddlEvent.SelectedIndex = 0;

            // Clear Gender
            rblGender.ClearSelection();

            // Clear Skills
            foreach (ListItem item in cblSkills.Items)
            {
                item.Selected = false;
            }

            // Uncheck Terms
            chkTerms.Checked = false;

            // Hide success message
            lblSuccess.Visible = false;
        }
    }
}
