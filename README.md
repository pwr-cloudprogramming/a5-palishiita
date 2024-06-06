# Ishiita Pal - Terraform, EC2, TicTacToe report

- Course: *Cloud programming*
- Group: *266901 - Ishiita Pal*
- Date: *17th April, 2024*

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## Environment architecture  
- frontend application files into `/frontend/src` for this I used Spring
- backend application files into `/backend/src` for this I used CSS and JS
- Dockerfile to build frontend container image into `/frontend`
- Dockerfile to build backend container image into `/backend`
- all other scripts to build your solution into `/build` which contains the ` dockercompose.yaml` and `run.sh`
- 

## Preview

Screenshots of configured AWS services. Screenshots of your application running.

![Screenshot 2024-04-25 130730](https://github.com/pwr-cloudprogramming/a5-palishiita/assets/54171798/f9d9ec4a-48b8-4527-b60d-0d3f65fcd377)

![Screenshot 2024-04-25 130755](https://github.com/pwr-cloudprogramming/a5-palishiita/assets/54171798/5c734f87-7796-49be-852e-88c5284d765d)

![Screenshot 2024-04-25 131119](https://github.com/pwr-cloudprogramming/a5-palishiita/assets/54171798/a88889af-8ff6-4df6-84c4-3c5d6a0d5f8e)

![Screenshot 2024-04-25 131317](https://github.com/pwr-cloudprogramming/a5-palishiita/assets/54171798/0a0219c4-555f-4a8e-a020-36f3c4750f6a)


## Reflections

- **What Did You Learn?**
This assignment provided an in-depth understanding of using Terraform to deploy infrastructure on AWS. I learned how to configure and manage AWS services programmatically, which is crucial for automating and scaling cloud solutions. Specifically, I gained hands-on experience with setting up VPCs, subnets, internet gateways, and routing tables, all from scratch without using pre-built modules.

- **What Obstacles Did You Overcome?**
One significant challenge was ensuring all dependencies were correctly installed and configured on the EC2 instance. This involved not only installing Docker, Apache, Nginx, and other necessary software but also troubleshooting various compatibility issues that arose. Additionally, configuring security groups to allow proper access via SSH, HTTP, and custom ports required careful planning and testing to ensure the application was both accessible and secure.

- **What Helped Most in Overcoming Obstacles?**
Thorough documentation and community support played a vital role in overcoming these challenges. Terraform’s extensive documentation and various online forums provided solutions and best practices for many of the issues encountered. Additionally, breaking down tasks into smaller, manageable parts and testing each component individually helped in isolating and resolving problems more efficiently.

- **Was There Something That Surprised You?**
I was pleasantly surprised by the robustness and flexibility of Terraform. Its ability to manage complex infrastructures with relative ease and its state management capabilities were particularly impressive. Also, seeing the application running smoothly on the configured EC2 instance after deploying the infrastructure was a very rewarding experience.


