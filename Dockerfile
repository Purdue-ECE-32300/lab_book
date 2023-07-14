FROM python:3.11-slim-bookworm


# Install git and make
RUN apt-get update && apt-get install -y git make vim-gtk3

# Clone the lab_book repo (private)
#RUN git clone git@github.itap.purdue.edu:ECE-32300/lab_book.git

WORKDIR /lab_book

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN make

EXPOSE 8000
CMD python -m http.server 8000 --directory /lab_book/source/_build/html
