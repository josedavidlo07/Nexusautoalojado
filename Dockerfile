FROM python:3.11-slim


WORKDIR /app


RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*



COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


COPY app/ ./app/
COPY run.py ./run.py


EXPOSE 8000


CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
