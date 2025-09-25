# Software Packaging & Deployment Demo

This repository demonstrates a best-practice workflow for building, packaging, and deploying software in an enterprise Red Hat Enterprise Linux (RHEL) environment.

### Workflow Overview

This project simulates the end-to-end process for packaging the Nginx web server:

1.  **Build & Package (`scripts/`):** A Bash script (`build_nginx_rpm.sh`) automates the process of fetching source code, building an RPM package, and preparing it for distribution.
2.  **Store Artifact (`JFrog Artifactory`):** The final step of the build script is to upload the generated RPM to a secure artifact repository like JFrog Artifactory. This acts as our single source of truth.
3.  **Deploy & Configure (`ansible/`):** An Ansible playbook handles the deployment. It configures target servers to use our Artifactory repository, installs the RPM, deploys a custom configuration from a template, and ensures the service is running.

### Key Technologies Demonstrated
* **Linux/Bash Scripting:** For repeatable, automated builds.
* **RHEL Packaging (RPM):** For creating standardized, manageable software packages.
* **JFrog Artifactory:** As the central repository for storing and managing build artifacts.
* **Ansible:** For idempotent and scalable infrastructure-as-code deployments.