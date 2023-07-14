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
   jupyter-book build -W source
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


# Reference Material

- [Executable Books](https://executablebooks.org/en/latest/)
- [Jupyter Book](https://jupyterbook.org/en/stable/intro.html)
- [MyST Parser](https://myst-parser.readthedocs.io/en/latest/index.html)
- [Roles and Directives](https://myst-parser.readthedocs.io/en/latest/syntax/roles-and-directives.html#)
  - [Docutils roles](https://docutils.sourceforge.io/docs/ref/rst/roles.html)
  - [Sphinx roles](https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html)
  - [Docutils directives](https://docutils.sourceforge.io/docs/ref/rst/directives.html)
  - [Sphinx directives](https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html)


# Docker

1. To build the development image.

   ```sh
   docker build -t jhcole/lab_book .
   ```

2. Push to docker hub.

   ```sh
   docker push jhcole/lab_book
   ``

3. From the docker hub.

   ```sh
   docker pull jhcole/lab_book
   ```

4. To run the development image.

   ```sh
   docker run -dit --rm -p 8000:8000 --name lab_book jhcole/lab_book
   ```
5. Connect to the running container

   ```sh
   docker exec -it lab_book bash
   ```
