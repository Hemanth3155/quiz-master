📚 Quiz App Deployment Using Terraform & Azure
This project helps you deploy a simple Quiz Web Application to Microsoft Azure using Terraform. Don't worry if you're new to this – just follow the steps carefully!

🌟 What You'll Learn
How to use Terraform to set up cloud resources

How to deploy a web app to Microsoft Azure

Basics of cloud infrastructure

🛠 Tools Required
Make sure you have these installed:

Tool	Version	Link
Terraform	v1.5+	✅
Azure CLI	v2.45+	✅
A GitHub account	Any	✅
Azure Subscription (Free or Paid)	Any	✅

🚀 Step-by-Step Guide
1. Clone the Project
bash
Copy
Edit
git clone https://github.com/your-username/quiz-terraform-app.git
cd quiz-terraform-app
2. Login to Azure
Login using the Azure CLI:

bash
Copy
Edit
az login
This will open a browser – sign in with your Azure account.

3. Set Your Azure Subscription
Get your subscription ID:

az account show --query id -o tsv
Then set it:

$env:SUBSCRIPTION_ID = "paste your subscription ID" 
$env:TF_VAR_subscription_id = $env:SUBSCRIPTION_ID



4. Initialize Terraform

terraform init
This sets up Terraform to use the Azure provider.

5. Check for Errors

terraform validate
Make sure everything looks good.

6. Create the Infrastructure 🚧

terraform apply
Type yes when it asks for confirmation. This will:

Create a resource group

Create a service plan

Deploy the quiz app as an Azure web app

7. View Your Web App
After deployment, Terraform will show an output like this:


quiz_app_url = https://your-app-name.azurewebsites.net
Open that URL in your browser 🎉

🧹 Clean Up (Optional)
To remove everything:


terraform destroy
📁 Project Structure
```
quiz-master/
├── site/
│   ├── index.html
│   ├── script.js
│   └── style.css
├── main.tf           # Main Terraform code
├── variables.tf      # Variables used in the project
├── outputs.tf        # Outputs like the app URL
├── terraform.tfvars
└── README.md         # This file

💡 Tips
If you get an error about "quota" or "F1 VMs = 0", change the sku_name in main.tf to "B1" instead of "F1".

If a name like quizstorage is already taken, change it to something unique like quizstorage12345.

🙋 Need Help?
If you're stuck, try:

Googling the error message

Asking your teacher or classmates

Exploring Terraform Docs

Team Members and Roles:
Hemanth Mamidi - worked on web design
Sandeep Nalumasu - worked on main.tf and variable.tf
Ramakrishna Vadde - worked on outputs.tf and terraform.tfvs 
