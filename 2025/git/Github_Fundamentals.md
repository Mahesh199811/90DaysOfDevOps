# Git and GitHub Fundamentals Documentation

## Introduction to Git and GitHub

**Git** is a distributed version control system created by Linus Torvalds in 2005. It allows multiple developers to work on a single project without necessarily being connected to a central server. Git is designed to handle everything from small to very large projects with speed and efficiency.

**GitHub** is a web-based hosting service for version control using Git. It provides access control and several collaboration features such as bug tracking, feature requests, task management, and wikis for every project. GitHub offers both private repositories and free accounts which are commonly used to host open-source software projects.

## Key Git Commands and Their Uses

1. **`git init`**
   - Initializes a new Git repository. This command creates a new `.git` directory in your project, allowing Git to start tracking changes.
   ```bash
   git init
   ```

2. **`git add`**
   - Adds files to the staging area before committing. It tells Git you want to include updates to a particular file in the next commit.
   ```bash
   git add <file>
   git add .
   ```

3. **`git commit -m “message”`**
   - Records or snapshots the file permanently in the version history with a descriptive message explaining the change.
   ```bash
   git commit -m "Initial commit"
   ```

4. **`git config --global user.name "<Githubusername>"`**
   - Sets the name you want attached to your commit transactions.
   ```bash
   git config --global user.name "YourUsername"
   ```

5. **`git config --global user.email "<user email>"`**
   - Sets the email you want attached to your commit transactions.
   ```bash
   git config --global user.email "your_email@example.com"
   ```

6. **`git status`**
   - Displays the state of the working directory and the staging area. It lets you see which changes have been staged, which haven't, and which files aren't being tracked by Git.
   ```bash
   git status
   ```

7. **`git log`**
   - Shows the commit logs.
   ```bash
   git log
   ```

8. **`git log --oneline`**
   - Shows the commit logs in a compact format.
   ```bash
   git log --oneline
   ```

9. **`git branch`**
   - Lists all the local branches in the current repository.
   ```bash
   git branch
   ```

10. **`git checkout -b dev`**
    - Creates a new branch named `dev` and switches to it.
    ```bash
    git checkout -b dev
    ```

11. **`git checkout dev`**
    - Switches to an existing branch named `dev`.
    ```bash
    git checkout dev
    ```

12. **`git remote -v`**
    - Shows the remote repositories that your local repository is configured to use.
    ```bash
    git remote -v
    ```

13. **`git remote add origin <Git URL>`**
    - Adds a new remote named `origin` to your local repository.
    ```bash
    git remote add origin https://github.com/username/repo.git
    ```

14. **`git remote set-url origin <URL>`**
    - Changes the URL that a remote points to.
    ```bash
    git remote set-url origin https://github.com/username/repo.git
    ```

15. **`git push origin master`**
    - Pushes the commits from your local `master` branch to the `origin` remote.
    ```bash
    git push origin master
    ```

16. **`git pull origin master`**
    - Fetches and merges changes from the remote `master` branch to your local branch.
    ```bash
    git pull origin master
    ```

17. **`ssh-keygen`**
    - Generates a new SSH key, used for authenticating to remote servers like GitHub.
    ```bash
    ssh-keygen
    ```

18. **`git clone <repository>`**
    - Clones a repository into a new directory.
    ```bash
    git clone git@github.com:username/repo.git
    ```

19. **`git diff`**
    - Shows the differences between files in the working directory and the index.
    ```bash
    git diff
    
## Here how i created a shell script and use git commands


##
![alt text](<Screenshot 2025-02-10 at 10.19.45 AM.png>)

The above image shows a series of Git commands being executed to set up and manage a shell script for user management.

1. First, a shell script called `user_management.sh` is created and given execute permissions (chmod 764)
2. The script appears to have several options for managing user accounts:
   - Creating new users (-c)
   - Deleting users (-d)
   - Resetting passwords (-r)
   - Listing users (-l)
   - Displaying help (-h)

3. Then, a series of Git commands are executed to:
   - Initialize a new Git repository (`git init`)
   - Add the user management script to version control
   - Configure Git with user name "Mahesh199811" and email
   - Create and add a README.md file
   - Make two commits: one for the shell script and one for the readme file



![alt text](<Screenshot 2025-02-10 at 11.08.34 AM.png>)

The above image shows Git branch management and file operations.

Initially attempts to use ls command to lists directory contents
Creates and switches to a new dev branch using git checkout -b dev
Creates a new file called from_dev.txt using vim
Stages and commits the new file to the dev branch
Demonstrates switching between master and dev branches using git checkout
Shows how the file from_dev.txt is only visible in the dev branch, not in master

The main purpose appears to be demonstrating basic Git branching operations and how different branches can contain different files while working on the same project.



![alt text](<Screenshot 2025-02-10 at 12.12.43 PM.png>)

The above image shows connecting a local Git repository to GitHub and pushing code.

1. First checks remote repository status with `git remote -v`
2. Adds a GitHub repository as remote origin using `git remote add origin`
3. Updates the remote URL to use a personal access token (shown in the longer URL with 'ghp_')
4. Pushes the local master branch to GitHub using `git push origin master`
5. Git shows the push progress (9 objects transferred)
6. Finally, GitHub provides a URL to create a pull request for the master branch

The main purpose here is establishing a connection between a local Git repository and GitHub, then pushing the local code to the remote repository for the first time.



![alt text](<Screenshot 2025-02-10 at 12.22.39 PM.png>)

The above image shows synchronization between local and remote Git repositories.

1. First pulls changes from remote repository using `git pull origin master`
   - Receives a new file `from_remote.txt`

2. Then creates a new local file:
   - Creates `from_local.txt` using vim
   - Stages and commits it with message "Added local file"
   - Pushes it to the remote repository

3. The final directory listing shows all files present:
   - README.md
   - from_dev.txt
   - from_local.txt (newly added locally)
   - from_remote.txt (pulled from remote)
   - user_management.sh

This demonstrates a typical Git workflow of pulling remote changes, making local changes, and pushing those changes back to the remote repository.



![alt text](<Screenshot 2025-02-10 at 12.42.30 PM.png>)

The screenshot displays the process of setting up SSH keys and using them to clone a GitHub repository in a Linux environment. Here's a brief summary:

1. **SSH Key Generation**:
   - The user runs `ssh-keygen` to create an SSH key pair (`id_ed25519`).
   - The public key is saved in `/home/ubuntu/.ssh/id_ed25519.pub`, and the private key in `/home/ubuntu/.ssh/id_ed25519`.

2. **Viewing the Keys**:
   - The user lists (`ls`) the contents of the `.ssh` directory to confirm the presence of the keys.
   - They use `cat` to display the contents of the public key file (`id_ed25519.pub`).

3. **Repository Setup**:
   - A new directory named `github_repo` is created and navigated into.
   - The user clones a GitHub repository (`90DaysOfDevOps.git`) using the `git clone` command and confirms the connection to the GitHub server via the SSH key.
   - Git reports the successful cloning of the repository.

This process ensures secure SSH-based authentication to interact with GitHub without requiring a password for each operation.

![alt text](<Screenshot 2025-02-10 at 12.46.59 PM.png>)

The screenshot demonstrates the steps to edit a file in a Git repository, commit the changes, and push them to the remote repository. Here's a summary:

1. **Navigating the Repository**:
   - The user lists the files in the cloned `90DaysOfDevOps` repository and navigates to it.

2. **Editing a File**:
   - The `README.md` file is opened and edited using `vim`.

3. **Checking Repository Status**:
   - `git status` shows that the `README.md` file has been modified.

4. **Viewing Changes**:
   - `git diff` is used to display the changes made to the `README.md` file, which includes adding the line `+lets begin the Challenge`.

5. **Staging and Committing Changes**:
   - The modified file is staged using `git add README.md`.
   - A commit is made with the message "Changes in readme file" using `git commit -m`.

6. **Pushing Changes**:
   - The changes are pushed to the remote repository (`origin master`) using `git push origin master`.

This process outlines a typical workflow for making and pushing changes to a Git repository.



![alt text](<Screenshot 2025-02-10 at 1.10.29 PM.png>)

Finally I have tried to clone the repository in my local using VS Code and created a branch from the master branch and then add a file.
Then I add some documents in the file and commit the changes to the newly created branch.
Finally I have push the changes to the branch.