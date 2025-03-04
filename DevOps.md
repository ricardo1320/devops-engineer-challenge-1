# DevOps #

Dear applicant,

Congratulations, you made it to the Challenge!

Why do we ask you to complete this challenge?

First of all, we need to have some way of comparing different applicants, and we try to answer certain questions which we can not out-right ask in an interview - also we don't want to ask too many technical questions in a face-to-face interview to not be personally biased in a potentially stressful situation.  This challenge gives you the possibility to shine :).

Note that there is nothing wrong with googling when you have certain questions or are unsure about some parts, but you should not outright copy code that you don't understand. If you decide to copy code, please mark it as copied citing the source.

## Task 1: Scripting ##

A Linux server is hosted with IMAP service. All the IMAP member mail directory is configured under specific domain directory e.g /home/domain/member/mail. Customer requested for a simple backup solution using bash script.
* Implement a script that will find all the files present in the mail directory between specific date & time e.g. from 01 August 9am to 02 August 8am.
* Copy all the files to remote passive IMAP server under the same domain/user directory structure

## Task 2: IaC ##

Use the infrastructure as code (IaC) tool of your choice (Terraform/Cloudformation/Ansible/Python etc) and cloud of your choice (AWS/Azure/GCP). Create a deployment of https://github.com/scotch-io/node-todo.

## Task 3: Processes ##

A tech startup working on a project has 10 team members. The project consists of 3 modules and they want to follow git multi repo based approach. On each module a team of 2 developers and 1 QA are supposed to work together and 1 manager oversees the entire project. Their goal is to have continuous product release strategy. To achieve their goal
* What will be the git branching strategy? (elaborate options with pros and cons)
* Which tool you will consider for CI/CD?
* What will be your build promotion plans (Dev - QA - Prod)?
* Provide CI/CD implementation plans with stages
* How will you manage module version dependencies?

## Task Submission ##

Please create a directory containing all files you created for this challenge, any written documents and an .md file with instructions how to setup your project and run it (if applicable). You can either create a *private* repo and add us as contributors or send us your solution as .zip.
