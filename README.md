# Getting Started

1. Install [Git](https://github.com/git-guides/install-git) and [Python 3.11](https://www.python.org/)
2. Download this repository via HTTPS

   ```sh
   git clone https://github.itap.purdue.edu/ECE-32300/lab_book.git
   ```
   or via SSH

   ```sh
   git clone git@github.itap.purdue.edu:ECE-32300/lab_book.git
   ```

3. Set up a Python virtual environment.

   ```sh
   python3.11 -m venv .env3.11
   ```

4. Activate the new virtual environment.

   i. For Unix like systems (Mac, or Linux)
   ```sh
   source ./.env3.11/bin/activate
   ```
   ii. On Windows, activate the virtual environment 
   ```sh
   TODO
   ```

5. Install required Python modules

   ```sh
   python3.11 -m pip install -r requirements.txt
   ```

6. Build the book.

   ```sh
   jupyter-book build
   ```

   It is recommended that you preview the local copy book of the by opening the newly created `index.html` file in a browser before publishing any changes.

7. Use an Edit -> Build -> Preview cycle to make changes to the book. Commit the
changes once you are satisfied with the results.

   ```sh
   git add -p
   git commit -m "The commit message."
   ```

8. Publish your changes.

   ```sh
   ghp-import --no-jekyll --push --no-history ./source/_build/html
   ```

9. View the live results

   https://pages.github.itap.purdue.edu/ECE-32300/lab_book/intro.html