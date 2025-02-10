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
    ```