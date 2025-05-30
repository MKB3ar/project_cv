FROM python:3.12-bullseye

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgl1 \
        libsm6 \
        libxrender1 \
        libxext6 \
        ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]