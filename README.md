# do‑tf — Terraform PoC for DigitalOcean

This repository is a **Proof of Concept (PoC)** demonstrating how to use Terraform with DigitalOcean.  
It includes modular infrastructure, cloud-init user data, and clean variable management — ideal for learning Terraform in a cloud context.

---

## Clone this repo

```
git clone https://github.com/julio-at/do-tf.git
cd do-tf
```
## 📁 Project Structure

```
do‑tf/
├── main.tf                # Root module — invokes child modules / resources
├── providers.tf           # Provider configuration for DigitalOcean
├── versions.tf            # Terraform & provider version constraints
├── variables.tf           # Input variables definitions
├── terraform.tfvars       # Variable values (user-specific)
├── cloud-init.yaml        # cloud-init script for droplets
└── modules/
    └── (future modules…)  # e.g., vpc, droplet, firewall modules
```

---

## 🛠 Requirements

- Terraform >= 1.x  
- A valid DigitalOcean API token (with permissions to create droplets, VPCs, firewalls)  
- Curl / file access to serve `cloud-init.yaml` (as part of `user_data`)  

---

## ⚙️ Setup & Usage

1. **Set your API token**  
   In `terraform.tfvars`, set your DO token:  
   ```hcl
   do_token = "your_do_api_token_here"
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Validate syntax**
   ```bash
   terraform fmt
   terraform validate
   ```

4. **Plan**
   ```bash
   terraform plan
   ```

5. **Apply / Deploy**
   ```bash
   terraform apply
   ```

   Terraform will:
   - Create a VPC (if modularized)
   - Deploy a droplet with cloud-init provisioning
   - Associate firewall rules, SSH access, etc.

---

## 🔍 Access & Verification

- Use the output from Terraform (usually displaying the droplet public IP)  
- SSH into the droplet:
  ```bash
  ssh root@<droplet_public_ip>
  ```
  The `cloud-init.yaml` script should create users, set packages, etc.

- In the DigitalOcean control panel, you’ll see:
  - The VPC and its subnets  
  - The droplet(s) created  
  - Firewalls / rules applied  

---

## 🧹 Tear Down & Cleanup

To delete everything:
```bash
terraform destroy
```
This will remove all resources managed by Terraform, returning your account to the original state.

---

## 💡 Notes & Tips

- The `cloud-init.yaml` is central: it provisions the droplet at first boot  
- Use modules (vpc, droplet, firewall) to keep your Terraform code clean and reusable  
- Always separate **configuration (tfvars)** vs **logic (tf/ modules)**  
- This is work in progress — modules structure is ready to evolve for more complex infra  

---

## 🚀 Next Steps / Roadmap Ideas

- Modularize into `modules/vpc`, `modules/droplet`, `modules/firewall`  
- Add support for multiple droplets (via `for_each`)  
- Add security validations (`tflint`, `tfsec` in future)  
- Expand to multi-region or multi-environment setups  

---

## 🧠 Author & Learning Focus

This PoC was built by **Julio Alvarez** to master Terraform + DigitalOcean with real hands-on infrastructure.  
Every file is annotated, every module is teachable; pleae take this as your learning playground.
