FROM python:3.10-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN coverage run -m pytest
RUN coverage report
CMD ["python3", "app.py"]
