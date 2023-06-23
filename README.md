# Getting Started

1. Install [Git](https://github.com/git-guides/install-git) and [Python
3.11](https://www.python.org/)

2. Download this repository via HTTPS using your Purdue career account and password,

   ```sh
   git clone https://github.itap.purdue.edu/ECE-32300/lab_book.git
   ```
   or via SSH if you already have set up SSH key based authentication.

   ```sh
   git clone git@github.itap.purdue.edu:ECE-32300/lab_book.git
   ```

3. Set up a Python virtual environment.

   ```sh
   cd lab_book
   python3.11 -m venv .env3.11
   ```

4. Activate the new virtual environment.

   - For Unix like systems (Mac, or Linux)

     ```sh
     source ./.env3.11/bin/activate
     ```

   - On Windows:

     i. First launch Power Shell from the Start Menu using the Run as
        administrator option.
        ```sh
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
        ```
     ii. Then activate the virtual environment.

        - In a Windows PowerShell, use:
          ```sh
          .env3.11\Scripts\Activate.ps1
          ```
        - Or in a regular Windows terminal (e.g. cmd.exe) use:
          ```sh
          .env3.11\Scripts\activate.bat
          ```

5. Install required Python modules

   ```sh
   python -m pip install -r requirements.txt
   ```

6. Build the book.

   i. For Unix like systems (Mac, or Linux)
   ```sh
   make
   ```
   ii. On other systems use:
   ```sh
   jupyter-book build source
   ```

   It is recommended that you preview the local copy of the book by opening the
   newly created `source/_build/html/index.html` file in a browser before
   publishing any changes.

7. Use an Edit -> Build -> Preview cycle to make changes to the book. Commit the
changes once you are satisfied with the results.  Ensure you are working from
the latest source by running `git pull` before editing.

   ```sh
   git add -p
   git commit -m "The commit message."
   ```

8. Publish your changes.

   i. For Unix like systems (Mac, or Linux)
   ```sh
   make pub
   ```
   ii. On other systems use:
   ```sh
   ghp-import --no-jekyll --push --no-history ./source/_build/html
   ```

9. View the live results

   https://pages.github.itap.purdue.edu/ECE-32300/lab_book/intro.html